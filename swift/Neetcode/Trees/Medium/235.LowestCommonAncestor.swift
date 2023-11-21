// Given a binary search tree (BST), find the lowest common ancestor 
// (LCA) node of two given nodes in the BST.
// BST all elements to the left are less than the current node
// BST all elements to the right are greater than the current node
// No duplicates unless sepcified

// Time: n, Space: n
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let root = root else { return nil }

    let left = lowestCommonAncestor(root.left, p, q)
    let right = lowestCommonAncestor(root.right, p, q)

    if left != nil, right != nil { return root }
    if root === p || root === q { return root }
    if left != nil { return left }
    if right != nil { return right }
    
    return nil
}

// Time: n, Space: 1
func lowestCommonAncestor(_ root: TreeNode?, _ p: TreeNode?, _ q: TreeNode?) -> TreeNode? {
    guard let pVal = p?.val, let qVal = q?.val else { return nil }

    var current = root

    while let value = current?.val {
        if pVal > value && qVal > value {
            current = current?.right
        } else if pVal < value && qVal < value {
            current = current?.left
        } else {
            return current
        }
    }

    return nil
}
