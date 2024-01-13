// Given the root of a binary tree, return the inorder traversal of its nodes' values.

// Time: O(n), Space: O(h)
func inorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    var stack = [TreeNode?]()
    var current = root

    while !stack.isEmpty || current != nil {
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

    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }

        dfs(root.left)
        result.append(root.val)
        dfs(root.right)
    }

    dfs(root)
    return result
}