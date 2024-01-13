// Given the roots of two binary trees root and subRoot, 
// return true if there is a subtree of root with the same structure and 
// node values of subRoot and false otherwise.

// Time: O(n * m), Space: O(h)
func check(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
    if p == nil, q == nil { return true }
    guard let p = p, let q = q, p.val == q.val else { return false }

    return check(p.left, q.left) && check(p.right, q.right)
}

func isSubtree(_ root: TreeNode?, _ subRoot: TreeNode?) -> Bool {
    guard let root = root, let subRoot = subRoot else { return false }

    let left = isSubtree(root.left, subRoot)
    let right = isSubtree(root.right, subRoot)

    return check(root, subRoot) || left || right
}