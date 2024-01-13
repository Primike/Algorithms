// Given a binary tree, determine if it is height-balanced.

// Time: O(n), Space: O(h)
func isBalanced(_ root: TreeNode?) -> Bool {
    var result = 0

    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let left = dfs(root.left), right = dfs(root.right)
        result = max(result, abs(right - left))

        return max(left, right) + 1
    }

    dfs(root)
    return result <= 1
}