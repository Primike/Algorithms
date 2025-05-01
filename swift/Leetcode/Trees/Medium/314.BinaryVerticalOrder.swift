// Given the root of a binary tree, return the vertical order traversal 
// of its nodes' values. (i.e., from top to bottom, column by column).
// If two nodes are in the same row and column, 
// the order should be from left to right.

// Time: O(n), Space: O(n)
func verticalOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }

    var dict = [Int: [Int]]()
    var queue = [(0, root)]

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (x, node) = queue.removeFirst()
            dict[x, default: []].append(node.val)

            if let left = node.left { queue.append((x - 1, left)) }
            if let right = node.right { queue.append((x + 1, right)) }
        }
    }

    let minimum = dict.keys.min() ?? 0
    let maximum = dict.keys.max() ?? 0
    var result = [[Int]]()

    for i in minimum...maximum {
        if let array = dict[i] { result.append(array) }
    }

    return result
}