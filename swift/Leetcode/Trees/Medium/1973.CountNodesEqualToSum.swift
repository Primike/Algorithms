// Given the root of a binary tree, return the number of nodes where 
// the value of the node is equal to the sum of the values of its descendants.

// Time: O(n), Space: O(n)
func equalToDescendants(_ root: TreeNode?) -> Int {
    var result = 0

    func dfs(_ root: TreeNode?) -> Int {
        guard let root else { return 0 }

        let total = dfs(root.left) + dfs(root.right)
        if root.val == total { result += 1 }

        return total + root.val
    }

    dfs(root)
    return result
}