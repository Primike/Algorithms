//Given the root of a binary tree, invert the tree, and return its root.

//Swap/recursion order does not matter
func invertTree(_ root: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }

    let left = root.left
    let right = root.right

    root.left = invertTree(right)
    root.right = invertTree(left)

    return root
}