// Given the root of a binary tree, return the number of nodes where 
// the value of the node is equal to the sum of the values of its descendants.

// Time: O(n), Space: O(n)
func equalToDescendants(_ root: TreeNode?) -> Int {
    func dfs(_ root: TreeNode?) -> (Int, Int) {
        guard let root = root else { return (0, 0) }

        let left = dfs(root.left), right = dfs(root.right)
        let sum = left.0 + right.0
        let count = left.1 + right.1 + (sum == root.val ? 1 : 0)

        return (sum + root.val, count) 
    }  

    return dfs(root).1
}