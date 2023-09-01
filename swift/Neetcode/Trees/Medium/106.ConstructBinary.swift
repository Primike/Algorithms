// Given two integer arrays inorder and postorder where inorder is the inorder traversal 
// of a binary tree and postorder is the postorder traversal of the same tree, 
// construct and return the binary tree.

func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
    let inorderIndices = inorder.enumerated().reduce(into: [:]) { $0[$1.element] = $1.offset }
    var postIndex = postorder.count - 1

    func helper(_ left: Int, _ right: Int) -> TreeNode? {
        if left > right { return nil }

        let rootVal = postorder[postIndex]
        let root = TreeNode(rootVal)
        postIndex -= 1
        
        let index = inorderIndices[rootVal]!
        root.right = helper(index + 1, right)
        root.left = helper(left, index - 1)

        return root
    }

    return helper(0, inorder.count - 1) 
}