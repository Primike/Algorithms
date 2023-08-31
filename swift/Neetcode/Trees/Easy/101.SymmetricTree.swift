// Given the root of a binary tree, check whether it is a mirror of itself

func isSymmetric(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }

    func depthFirst(_ p: TreeNode?, _ q: TreeNode?) -> Bool {
        if p == nil, q == nil { return true }
        if p == nil || q == nil { return false }
        if p!.val != q!.val { return false}
        
        return depthFirst(p?.left, q?.right) && depthFirst(p?.right, q?.left)
    }

    return depthFirst(root.left, root.right)
}