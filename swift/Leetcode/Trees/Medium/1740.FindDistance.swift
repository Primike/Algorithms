// Given the root of a binary tree and two integers p and q, 
// return the distance between the nodes of value p and value q in the tree.

// Time: O(n), Space: O(h)
func findDistance(_ root: TreeNode?, _ p: Int, _ q: Int) -> Int {
    var result = 0

    func dfs(_ root: TreeNode?) -> (Bool, Int) {
        guard let root = root else { return (false, 0) }

        let left = dfs(root.left)
        let right = dfs(root.right)

        if left.0, right.0 { 
            result = left.1 + right.1
        } else if root.val == p || root.val == q {
            result = max(left.1, right.1)
            return (true, 1)
        }
        
        if left.0 { return (left.0, left.1 + 1) }
        if right.0 { return (right.0, right.1 + 1) }
        return (false, 0)
    }

    dfs(root)
    return result
}