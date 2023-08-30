// You are given the root node of a binary search tree (BST) and a value 
// to insert into the tree. Return the root node of the BST after the insertion. 
// It is guaranteed that the new value does not exist in the original BST.

func insertIntoBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let root = root else { return TreeNode(val) }

    var previous: TreeNode? = nil
    var current: TreeNode? = root

    while let value = current?.val {
        previous = current

        if val > value {
            current = current?.right
        } else {
            current = current?.left
        }
    }

    if (previous?.val ?? 0) > val {
        previous?.left = TreeNode(val)
    } else {
        previous?.right = TreeNode(val)
    }

    return root
}

func insertIntoBST2(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard let root = root else { return TreeNode(val) }

    if root.val > val {
        root.left = insertIntoBST(root.left, val)
    } else {
        root.right = insertIntoBST(root.right, val)
    }

    return root
}