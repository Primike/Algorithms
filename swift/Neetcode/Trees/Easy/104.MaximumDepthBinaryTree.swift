// Given the root of a binary tree, return its maximum depth.

// Time: O(n), Space: O(h)
func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    return 1 + max(maxDepth(root.left), maxDepth(root.right))
}
