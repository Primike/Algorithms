// Given a binary tree, find its minimum depth.
// The minimum depth is the number of nodes along the 
// shortest path from the root node down to the nearest leaf node.

// Time: O(n), Space: O(1)
func minDepth(_ root: TreeNode?) -> Int {
    var result = Int.max

    func dfs(_ root: TreeNode?, _ level: Int) -> TreeNode? {
        guard let root = root else { return nil }

        let left = dfs(root.left, level + 1)
        let right = dfs(root.right, level + 1)

        if left == nil, right == nil { result = min(result, level + 1) }

        return root
    }

    dfs(root, 0)
    return result == Int.max ? 0 : result
}