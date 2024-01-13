// You are given two binary trees root1 and root2. Return the merged tree.

// Time: O(n), Space: O(h)
func mergeTrees(_ root1: TreeNode?, _ root2: TreeNode?) -> TreeNode? {
    if root1 == nil, root2 == nil { return nil }
    if root1 == nil { return root2 }
    if root2 == nil { return root1 }

    root1?.val += (root2?.val ?? 0)

    root1?.left = mergeTrees(root1?.left, root2?.left)
    root1?.right = mergeTrees(root1?.right, root2?.right)

    return root1
}