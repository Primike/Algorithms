// Given the root of the binary tree, return the maximum amount of money 
// the thief can rob without alerting the police.

// Time: O(n), Space: O(h)
func rob(_ root: TreeNode?) -> Int {
    func dfs(_ node: TreeNode?) -> (Int, Int) {
        guard let node = node else { return (0, 0) }

        let left = dfs(node.left), right = dfs(node.right)

        let withVal = node.val + left.1 + right.1
        let without = max(left.0, left.1) + max(right.0, right.1)

        return (withVal, without)
    }

    let result = dfs(root)
    return max(result.0, result.1)
}