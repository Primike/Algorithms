// Given the roots of two binary trees root and subRoot, 
// return true if there is a subtree of root with the same structure and 
// node values of subRoot and false otherwise.

func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
    func isSameTree(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil && q == nil { return true }
        
        guard let p = p, let q = q, p.val == q.val else {
            return false
        }

        return isSameTree(p.left, q.left) && isSameTree(p.right, q.right)
    }

    guard let subRoot = subRoot else { return true }
    guard let root = root else { return false }

    if isSameTree(root, subRoot) { return true }
    
    return isSubtree(root.left, subRoot) || isSubtree(root.right, subRoot)
}
