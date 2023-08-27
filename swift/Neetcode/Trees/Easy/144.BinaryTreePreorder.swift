// Given the root of a binary tree, return the preorder traversal of its nodes' values.

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    var stack = [TreeNode?]()
    var current = root

    while current != nil || !stack.isEmpty {
        while current != nil {
            result.append(current?.val ?? 0)
            stack.append(current?.right)
            current = current?.left
        }

        current = stack.removeLast()
    }

    return result
}

func preorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()

    func depthFirst(_ root: TreeNode?) {
        guard let root = root else { return }

        result.append(root.val)
        depthFirst(root.left)
        depthFirst(root.right)
    }

    depthFirst(root)
    return result
}