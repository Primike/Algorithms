// Given the root of a binary tree, construct a string consisting of 
// parenthesis and integers from a binary tree with the preorder traversal way, 
// and return it.

// Time: O(n), Space: O(h)
func tree2str(_ root: TreeNode?) -> String {    
    guard let root = root else { return "" }

    var current = "\(root.val)"
    let left = tree2str(root.left)
    let right = tree2str(root.right)

    if right != "" { 
        current += "(\(left))(\(right))" 
    } else if left != "" {
        current += "(\(left))" 
    }
    
    return current
}