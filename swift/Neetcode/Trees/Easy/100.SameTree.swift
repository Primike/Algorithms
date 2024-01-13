// Given the roots of two binary trees p and q, write a function to check 
// if they are the same or not.

// Time: O(n), Space: O(h)
func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil && q == nil { return true }
    guard let p = p, let q = q, p.val == q.val else { return false }

    return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
}
