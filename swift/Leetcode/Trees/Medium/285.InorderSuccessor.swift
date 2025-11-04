// Given the root of a binary search tree and a node p in it, 
// return the in-order successor of that node in the BST. 
// If the given node has no in-order successor in the tree, return null.
// The successor of a node p is the node with the 
// smallest key greater than p.val.

// Time: O(n), Space: O(h)
func inorderSuccessor(_ root: TreeNode?, _ p: TreeNode?) -> TreeNode? {
    guard let p else { return nil }

    var result: TreeNode? = nil

    func dfs(_ root: TreeNode?) {
        guard let root else { return }

        dfs(root.left)
        if root.val > p.val, result == nil { result = root }
        dfs(root.right)
    }

    dfs(root)
    return result
}
