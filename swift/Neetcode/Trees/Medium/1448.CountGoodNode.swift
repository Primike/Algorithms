// Given a binary tree root, a node X in the tree is named good 
// if in the path from root to X there are no nodes with a value greater than X.
// Return the number of good nodes in the binary tree.

func goodNodes(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var result = 0

    func dfs(_ root: TreeNode?, _ maximum: Int) {
        guard let root = root else { return }

        if root.val >= maximum { result += 1 }

        dfs(root.left, max(root.val, maximum))
        dfs(root.right, max(root.val, maximum))
    }

    dfs(root, root.val)
    return result
}