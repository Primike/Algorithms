// Given a root node reference of a BST and a key, delete the node with the 
// given key in the BST. Return the root node reference (possibly updated) of the BST.

func deleteNode(_ root: TreeNode?, _ key: Int) -> TreeNode? {
    var newTree = TreeNode(0, root, nil)
    var previous: TreeNode? = newTree
    var current = root

    while current != nil && current!.val != key {
        previous = current

        if let currentValue = current?.val, currentValue > key {
            current = current?.left
        } else {
            current = current?.right
        }
    }

    if current == nil { return newTree.left }

    if let left = current?.left {
        if previous?.left === current {
            previous?.left = left
        } else {
            previous?.right = left
        }

        var leftLargest = left

        while let nextLargest = leftLargest.right {
            leftLargest = nextLargest
        }

        leftLargest.right = current?.right
    } else {
        if previous?.left === current {
            previous?.left = current?.right
        } else {
            previous?.right = current?.right
        }
    }

    return newTree.left
}

