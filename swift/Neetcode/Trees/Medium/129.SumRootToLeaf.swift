// You are given the root of a binary tree containing digits from 0 to 9 only.
// Return the total sum of all root-to-leaf numbers

// Time: O(n), Space: O(h)
func sumNumbers(_ root: TreeNode?) -> Int {
    var result = 0
    
    func dfs(_ node: TreeNode?, _ path: Int) {
        guard let node = node else { return }
        
        let newPath = path * 10 + node.val
        
        if node.left == nil && node.right == nil {
            result += newPath
        } else {
            dfs(node.left, newPath)
            dfs(node.right, newPath)
        }
    }
    
    dfs(root, 0)
    return result
}