// Given the root of a binary tree and an integer targetSum, 
// return true if the tree has a root-to-leaf path such that adding up 
// all the values along the path equals targetSum.

func hasPathSum(_ root: TreeNode?, _ targetSum: Int) -> Bool {
    guard let root = root else { return false }
    
    if root.left == nil && root.right == nil {
        return targetSum == root.val
    }
    
    let value = targetSum - (root.val ?? 0)
    
    return hasPathSum(root.left, value) || hasPathSum(root.right, value)
}