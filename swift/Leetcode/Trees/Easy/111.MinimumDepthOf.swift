// Given a binary tree, find its minimum depth.
// The minimum depth is the number of nodes along the 
// shortest path from the root node down to the nearest leaf node.

// Time: O(n), Space: O(w)
func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var queue = [root]
    var level = 1

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let first = queue.removeFirst()

            if first.left == nil, first.right == nil { return level }
            if let left = first.left { queue.append(left) }
            if let right = first.right { queue.append(right) }
        }

        level += 1 
    }

    return level
}


func minDepth2(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var stack = [(root, 1)]
    var result = Int.max

    while !stack.isEmpty {
        let (last, count) = stack.removeLast()

        if last.left == nil, last.right == nil { result = min(result, count) }
        if let left = last.left { stack.append((left, count + 1)) }
        if let right = last.right { stack.append((right, count + 1)) }
    }

    return result
}


func minDepth3(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var result = Int.max

    if let left = root.left { result = min(result, minDepth(left)) }
    if let right = root.right { result = min(result, minDepth(right)) }
    if result == Int.max { result = 0 }

    result += 1
    return result
}