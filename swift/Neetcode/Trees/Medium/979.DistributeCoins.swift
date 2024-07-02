// You are given the root of a binary tree with n nodes 
// where each node in the tree has node.val coins. 
// There are n coins in total throughout the whole tree.
// In one move, we may choose two adjacent nodes and 
// move one coin from one node to another. 
// A move may be from parent to child, or from child to parent.
// Return the minimum number of moves required 
// to make every node have exactly one coin.

// Time: O(n), Space: O(h)
func distributeCoins(_ root: TreeNode?) -> Int {
    var result = 0

    func dfs(_ root: TreeNode?) -> Int {
        guard let root = root else { return 0 }

        let left = dfs(root.left), right = dfs(root.right)

        result += abs(left) + abs(right)
        return root.val - 1 + left + right
    }

    dfs(root)
    return result
}