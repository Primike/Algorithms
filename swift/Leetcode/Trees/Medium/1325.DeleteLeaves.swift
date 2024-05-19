// Given a binary tree root and an integer target, 
// delete all the leaf nodes with value target.
// Note that once you delete a leaf node with value target, 
// if its parent node becomes a leaf node and has the value target, 
// it should also be deleted (you need to continue doing that until you cannot).

// Time: O(n), Space: O(h)
func removeLeafNodes(_ root: TreeNode?, _ target: Int) -> TreeNode? {
    guard let root = root else { return nil }

    root.left = removeLeafNodes(root.left, target)
    root.right = removeLeafNodes(root.right, target)

    if root.left == nil, root.right == nil, root.val == target { return nil }
    
    return root
}