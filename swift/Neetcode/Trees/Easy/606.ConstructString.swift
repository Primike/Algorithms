// Given the root of a binary tree, construct a string consisting of 
// parenthesis and integers from a binary tree with the preorder traversal way, 
// and return it.

func tree2str(_ root: TreeNode?) -> String {
    guard let root = root else { return "" }
    
    var result = "\(root.val)"
    let left = tree2str(root.left)
    let right = tree2str(root.right)
    

    if left == "", right == "" { return result }
    if left == "" { return result + "()(\(right))" } 
    if right == "" { return result + "(\(left))" } 

    return result + "(\(left))(\(right))"
}