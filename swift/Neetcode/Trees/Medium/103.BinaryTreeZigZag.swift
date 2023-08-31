// Given the root of a binary tree, return the zigzag level order 
// traversal of its nodes' values.

func zigzagLevelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else { return [] }

    var result = [[Int]]()
    var queue = [root]

    while !queue.isEmpty {
        var values = [Int]()

        for _ in 0..<queue.count {
            let node = queue.removeFirst()

            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }

            values.append(node.val)
        }

        if result.count % 2 != 0 { values = values.reversed() }
        result.append(values)
    }

    return result
}