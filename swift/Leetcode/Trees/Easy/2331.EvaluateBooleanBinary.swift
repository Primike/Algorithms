// Leaf nodes have either the value 0 or 1, 
// where 0 represents False and 1 represents True.
// Non-leaf nodes have either the value 2 or 3, 
// where 2 represents the boolean OR and 3 represents the boolean AND.
// The evaluation of a node is as follows:
// If the node is a leaf node, the evaluation is the value 
// of the node, i.e. True or False.
// Otherwise, evaluate the node's two children and apply 
// the boolean operation of its value with the children's evaluations.
// Return the boolean result of evaluating the root node.

// Time: O(n), Space: O(h)
func evaluateTree(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }

    if root.left == nil, root.right == nil { return root.val == 1 } 

    let left = evaluateTree(root.left)
    let right = evaluateTree(root.right)

    if root.val == 2 { return left || right }
    return left && right
}