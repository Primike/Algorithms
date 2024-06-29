// Given the root of a binary search tree (BST) and an integer target, 
// split the tree into two subtrees where the first subtree has nodes 
// that are all smaller or equal to the target value, 
// while the second subtree has all nodes that are greater than the target value. 
// It is not necessarily the case that the tree contains a node with the value target.
// Additionally, most of the structure of the original tree should remain. 
// Formally, for any child c with parent p in the original tree, 
// if they are both in the same subtree after the split, 
// then node c should still have the parent p.
// Return an array of the two roots of the two subtrees in order.

func splitBST(_ root: TreeNode?, _ target: Int) -> [TreeNode?] {
    guard let root = root else { return [nil, nil] }

    if root.val > target {
        let left = splitBST(root.left, target)
        root.left = left[1]

        return [left[0], root]
    } else {
        let right = splitBST(root.right, target)
        root.right = right[0]

        return [root, right[1]]
    }
}