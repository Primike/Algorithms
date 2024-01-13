// Given the root of a Binary Search Tree (BST), convert it to a Greater Tree 
// such that every key of the original BST is changed to the original key 
// plus the sum of all keys greater than the original key in BST.

// Time: O(n), Space: O(n)
func convertBST(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }
    
    var sum = 0 

    func dfs(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else { return nil }

        dfs(root.right)
        sum += root.val
        root.val = sum
        dfs(root.left)

        return root
    }

    return dfs(root)
}