// Given a root node reference of a BST and a key, delete the node with the 
// given key in the BST. Return the root node reference (possibly updated) of the BST.

func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    var root = root

    if (root?.val ?? 0) > key {
        root?.left = deleteNode(root?.left, key)
    } else if (root?.val ?? 0) < key {
        root?.right = deleteNode(root?.right, key)
    } else {
        if root?.left == nil && root?.right == nil {
            root = nil
        } else if root?.right == nil {
            root = root?.left
        } else if root?.left == nil {
            root = root?.right
        } else {
            var previous: TreeNode? = root
            var current = root?.right

            while let node = current, let left = node.left {
                previous = current
                current = current?.left
            }

            if previous === root {
                current?.left = root?.left
            } else {
                previous?.left = current?.right
                current?.right = root?.right
                current?.left = root?.left
            }
            
            root = current
        }
    }

    return root
}
