// Given two integer arrays inorder and postorder where inorder is the inorder traversal 
// of a binary tree and postorder is the postorder traversal of the same tree, 
// construct and return the binary tree.

// Time: O(n), Space: O(h)
// Create right nodes first b/c postorder
func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    let inorderDict = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    var i = postorder.count - 1

    func dfs(_ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }

        let new = TreeNode(postorder[i])
        let index = inorderDict[postorder[i]]!
        i -= 1

        new.right = dfs(index + 1, right)
        new.left = dfs(left, index - 1)

        return new
    }

    return dfs(0, inorder.count - 1) 
}