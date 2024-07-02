// Given a root node reference of a BST and a key, delete the node with the 
// given key in the BST. Return the root node reference (possibly updated) of the BST.

// Replaces Value, 2 elses reached one for key another for copy
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


func deleteNode2(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    guard let root = root else { return nil }
    
    var parent: TreeNode? = nil
    var current: TreeNode? = root
    var isLeftChild = false
    
    while let node = current, node.val != key {
        parent = current

        if key < node.val {
            current = node.left
            isLeftChild = true
        } else {
            current = node.right
            isLeftChild = false
        }
    }
    
    guard let nodeToDelete = current else { return root }
    
    if nodeToDelete.left == nil, nodeToDelete.right == nil {
        if nodeToDelete === root { return nil }

        if isLeftChild {
            parent?.left = nil
        } else {
            parent?.right = nil
        }
    } else if nodeToDelete.left == nil {
        if nodeToDelete === root { return nodeToDelete.right }

        if isLeftChild {
            parent?.left = nodeToDelete.right
        } else {
            parent?.right = nodeToDelete.right
        }
    } else if nodeToDelete.right == nil {
        if nodeToDelete === root { return nodeToDelete.left }

        if isLeftChild {
            parent?.left = nodeToDelete.left
        } else {
            parent?.right = nodeToDelete.left
        }
    } else {
        var successorParent: TreeNode? = nodeToDelete
        var successor: TreeNode? = nodeToDelete.right
        
        while let left = successor?.left {
            successorParent = successor
            successor = left
        }
        
        if successor !== nodeToDelete.right {
            successorParent?.left = successor?.right
            successor?.right = nodeToDelete.right
        }

        successor?.left = nodeToDelete.left
        
        if nodeToDelete === root { return successor }
        
        if isLeftChild {
            parent?.left = successor
        } else {
            parent?.right = successor
        }
    }
    
    return root
}