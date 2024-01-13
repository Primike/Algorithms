// A binary tree X is flip equivalent to a binary tree Y if and only 
// if we can make X equal to Y after some number of flip operations.
// Given the roots of two binary trees root1 and root2, return true 
// if the two trees are flip equivalent or false otherwise.

// Time: O(n), Space: O(h)
func flipEquiv(_ root1: TreeNode?, _ root2: TreeNode?) -> Bool {
    if root1 == nil, root2 == nil { return true }
    guard let root1 = root1, let root2 = root2 else { return false }
    if root1.val != root2.val { return false }

    let noFlipLeft = flipEquiv(root1.left, root2.left) 
    let noFlipRight = flipEquiv(root1.right, root2.right)
    let flipLeft = flipEquiv(root1.left, root2.right)
    let flipRight = flipEquiv(root1.right, root2.left)

    return (noFlipLeft && noFlipRight) || (flipLeft && flipRight)
}