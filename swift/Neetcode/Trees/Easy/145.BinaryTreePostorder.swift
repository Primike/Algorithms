// Given the root of a binary tree, return the postorder traversal of its nodes' values.

// Time: O(n), Space: O(h)
func postorderTraversal(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    
    func dfs(_ root: TreeNode?) {
        guard let root = root else { return }

        dfs(root.left)
        dfs(root.right)
        result.append(root.val)
    }

    dfs(root)
    return result
}