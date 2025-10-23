// Given the root of a binary tree, return the sum of all left leaves.
// A leaf is a node with no children. 
// A left leaf is a leaf that is the left child of another node.

// Time: O(n), Space: O(w)
func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var queue = [root]
    var result = 0

    while !queue.isEmpty {
        let first = queue.removeFirst()

        if let left = first.left, left.left == nil, left.right == nil { 
            result += left.val
        }

        if let left = first.left { queue.append(left) }
        if let right = first.right { queue.append(right) }
    }

    return result
}

func sumOfLeftLeaves2(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var result = sumOfLeftLeaves(root.left) + sumOfLeftLeaves(root.right)

    if let left = root.left, left.left == nil, left.right == nil { 
        result += left.val
    }

    return result
}