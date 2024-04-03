// Given a binary tree, find the lowest common ancestor (LCA) of two given nodes in the tree.

// Time: O(n), Space: O(h)
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }

    let left = lowestCommonAncestor(root.left, p, q)
    let right = lowestCommonAncestor(root.right, p, q)

    if left != nil, right != nil { return root }
    if root === p || root === q { return root }

    return left == nil ? right : left
}