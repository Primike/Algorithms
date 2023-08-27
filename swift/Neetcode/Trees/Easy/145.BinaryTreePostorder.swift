// Given the root of a binary tree, return the postorder traversal of its nodes' values.

func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    
    func depthFirst(_ root: TreeNode?) {
        guard let root = root else { return }

        depthFirst(root.left)
        depthFirst(root.right)
        result.append(root.val)
    }

    depthFirst(root)
    return result
}