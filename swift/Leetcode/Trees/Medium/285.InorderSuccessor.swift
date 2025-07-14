// Given the root of a binary search tree and a node p in it, 
// return the in-order successor of that node in the BST. 
// If the given node has no in-order successor in the tree, return null.
// The successor of a node p is the node with the 
// smallest key greater than p.val.

// Time: O(n), Space: O(h)
func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
    var last: TreeNode? = nil

    func dfs(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        if let left = dfs(root.left) { return left }
        if last === p { return root }
        last = root
        if let right = dfs(root.right) { return right}

        return nil
    }

    return dfs(root)
}