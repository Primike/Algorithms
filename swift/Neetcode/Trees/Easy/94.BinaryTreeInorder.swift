// Given the root of a binary tree, return the inorder traversal of its nodes' values.

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    var stack = [TreeNode?]()
    var current = root

    while current != nil || !stack.isEmpty {
        while current != nil {
            stack.append(current)
            current = current?.left
        }

        current = stack.removeLast()
        result.append(current?.val ?? 0)
        current = current?.right
    }
    
    return result
}

func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()

    func depthFirst(_ root: TreeNode?) {
        guard let root = root else { return }

        depthFirst(root.left)
        result.append(root.val)
        depthFirst(root.right)
    }

    depthFirst(root)
    return result
}

