// Given a root node reference of a BST and a key, delete the node with the 
// given key in the BST. Return the root node reference (possibly updated) of the BST.

// Replaces Value
func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let root = root else { return nil }

    if key > root.val {
        root.right = deleteNode(root.right, key)
    } else if key < root.val {
        root.left = deleteNode(root.left, key)
    } else {
        if root.left == nil {
            return root.right
        } else if root.right == nil {
            return root.left
        }

        var current = root.right

        while let left = current?.left {
            current = left
        }

        root.val = current?.val ?? 0
        root.right = deleteNode(root.right, root.val)
    }

    return root
}