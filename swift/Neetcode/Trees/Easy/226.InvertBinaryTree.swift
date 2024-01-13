// Given the root of a binary tree, invert the tree, and return its root.

// Time: O(n), Space: O(h)
func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }

    let left = invertTree(root.left), right = invertTree(root.right )
    root.left = right
    root.right = left

    return root
}