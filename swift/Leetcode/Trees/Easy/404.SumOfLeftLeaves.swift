// Given the root of a binary tree, return the sum of all left leaves.
// A leaf is a node with no children. 
// A left leaf is a leaf that is the left child of another node.

// Time: O(n), Space: O(w)
func sumOfLeftLeaves(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }
    
    var queue = [(root, false)]
    var result = 0

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (first, bool) = queue.removeFirst()
            
            if first.left == nil, first.right == nil, bool { result += first.val }
            if let left = first.left { queue.append((left, true)) }
            if let right = first.right { queue.append((right, false)) }
        }
    }

    return result
}