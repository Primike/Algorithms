// Given the root of a binary tree, return the number of nodes 
// where the value of the node is equal to the 
// average of the values in its subtree.

// Time: O(n), Space: O(n)
func averageOfSubtree(_ root: TreeNode?) -> Int {
    var result = 0

    func dfs(_ root: TreeNode?) -> (Int, Int) {
        guard let root = root else { return (0, 0) }

        let left = dfs(root.left), right = dfs(root.right)
        let sum = left.0 + right.0 + root.val
        let count = left.1 + right.1 + 1

        if sum / count == root.val { result += 1 }

        return (sum, count)
    }

    dfs(root)
    return result
}