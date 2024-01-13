// Given a binary tree root, a node X in the tree is named good 
// if in the path from root to X there are no nodes with a value greater than X.
// Return the number of good nodes in the binary tree.

// Time: O(n), Space: O(h)
func goodNodes(_ root: TreeNode?) -> Int {
    var result = 0

    func dfs(_ node: TreeNode?, _ maximum: Int) {
        guard let node = node else { return }

        if maximum <= node.val { result += 1 }
        
        dfs(node.left, max(maximum, node.val))
        dfs(node.right, max(maximum, node.val))
    }

    dfs(root, .min)
    return result
}