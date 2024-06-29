// Given the root of a Binary Search Tree (BST), 
// convert it to a Greater Tree such that every key of 
// the original BST is changed to the original key plus 
// the sum of all keys greater than the original key in BST.

// Time: O(n), Space: O(h)
func bstToGst(_ root: TreeNode?) -> TreeNode? {
    var total = 0

    func dfs(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        dfs(root.right)
        total += root.val
        root.val = total
        dfs(root.left)

        return root
    }

    return dfs(root)
}