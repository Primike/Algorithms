// Given the root of a binary tree, return the vertical order traversal 
// of its nodes' values. (i.e., from top to bottom, column by column).
// If two nodes are in the same row and column, 
// the order should be from left to right.

// Time: O(n), Space: O(n)
func verticalOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }

    var xToNodes = [Int: [Int]]()
    var queue = [(root, 0)]

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (node, x) = queue.removeFirst()
            xToNodes[x, default: []].append(node.val)
            
            if let left = node.left { queue.append((left, x - 1)) }
            if let right = node.right { queue.append((right, x + 1)) }
        }
    }

    let minimum = xToNodes.keys.min() ?? 0
    let maximum = xToNodes.keys.max() ?? 0
    var result = [[Int]]()

    for i in minimum...maximum {
        result.append(xToNodes[i, default: []])
    }

    return result
}