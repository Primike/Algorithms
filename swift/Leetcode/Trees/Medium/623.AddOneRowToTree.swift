// Given the root of a binary tree and two integers val and depth, 
// add a row of nodes with value val at the given depth depth.
// Note that the root node is at depth 1.

// Time: O(n), Space: O(n)
func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
    guard let root else { return nil }
    
    if depth == 1 { return TreeNode(val, root, nil) }

    var stack = [(root, 1)]

    while !stack.isEmpty {
        let (last, level) = stack.removeLast()

        if level == depth - 1 {
            last.left = TreeNode(val, last.left, nil) 
            last.right = TreeNode(val, nil, last.right)
        } else {
            if let left = last.left { stack.append((left, level + 1)) }
            if let right = last.right { stack.append((right, level + 1)) }
        }
    }

    return root
}

// Time: O(n), Space: O(n)
func addOneRow(_ root: TreeNode?, _ val: Int, _ depth: Int) -> TreeNode? {
    if depth == 1 {
        let newNode = TreeNode(val, root, nil)
        return newNode
    }

    guard let root else { return nil }

    if depth > 2 {
        root.left = addOneRow(root.left, val, depth - 1)
        root.right = addOneRow(root.right, val, depth - 1)
    } else {
        root.left = TreeNode(val, root.left, nil)
        root.right = TreeNode(val, nil, root.right)
    }

    return root
}