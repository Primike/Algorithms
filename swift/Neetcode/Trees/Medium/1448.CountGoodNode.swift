// Given a binary tree root, a node X in the tree is named good 
// if in the path from root to X there are no nodes with a value greater than X.
// Return the number of good nodes in the binary tree.

func goodNodes(_ root: TreeNode?) -> Int {
    var result = 0

    func dfs(_ node: TreeNode?, _ prevMax: Int) {
        guard let node = node else { return }

        if prevMax <= node.val { result += 1 }
        
        dfs(node.left, max(prevMax, node.val))
        dfs(node.right, max(prevMax, node.val))
    }

    dfs(root, .min)
    return result
}
