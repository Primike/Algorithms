// Given the root of a binary tree and two integers val and depth, 
// add a row of nodes with value val at the given depth depth.
// Note that the root node is at depth 1.

// Time: O(n), Space: O(n)
func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
    if depth == 1 {
        let newNode = TreeNode(val, root, nil)
        return newNode
    }

    guard let root else { return nil }

    if depth > 2 {
        root.left = addOneRow(root.left, val, depth - 1)
        root.right = addOneRow(root.right, val, depth - 1)
    } else {
        root.left = TreeNode(val, root.left, nil)
        root.right = TreeNode(val, nil, root.right)
    }

    return root
}