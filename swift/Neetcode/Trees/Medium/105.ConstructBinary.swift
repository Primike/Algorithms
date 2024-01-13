// Given two integer arrays preorder and inorder where preorder is the 
// preorder traversal of a binary tree and inorder is the inorder traversal 
// of the same tree, construct and return the binary tree.

// Time: O(n), Space: O(h)
func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {
    let inorderDict = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset}
    var i = 0

    func dfs(_ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }

        let new = TreeNode(preorder[i])
        let index = inorderDict[preorder[i]]!
        i += 1

        new.left = dfs(left, index - 1)
        new.right = dfs(index + 1, right)

        return new
    }

    return dfs(0, inorder.count - 1)
}