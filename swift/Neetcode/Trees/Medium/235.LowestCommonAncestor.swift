// Given a binary search tree (BST), find the lowest common ancestor 
// (LCA) node of two given nodes in the BST.
// BST all elements to the left are less than the current node
// BST all elements to the right are greater than the current node
// No duplicates unless sepcified

func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let pVal = p?.val, let qVal = q?.val else {
        return nil
    }

    var current = root

    while let currentVal = current?.val {
        if pVal > currentVal && qVal > currentVal {
            current = current?.right
        } else if pVal < currentVal && qVal < currentVal {
            current = current?.left
        } else {
            return current
        }
    }

    return nil
}
