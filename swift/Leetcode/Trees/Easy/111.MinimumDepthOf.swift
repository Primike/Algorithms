// Given a binary tree, find its minimum depth.
// The minimum depth is the number of nodes along the 
// shortest path from the root node down to the nearest leaf node.

// Time: O(n), Space: O(1)
func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var result = Int.max

    if let left = root.left { result = min(result, minDepth(left)) }
    if let right = root.right { result = min(result, minDepth(right)) }
    if result == Int.max { result = 0 }

    result += 1
    return result
}