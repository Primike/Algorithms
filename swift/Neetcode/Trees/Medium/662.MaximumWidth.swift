// Given the root of a binary tree, return the maximum width of the given tree.

func widthOfBinaryTree(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var result = 0
    var queue = [(root, 0)]

    while !queue.isEmpty {
        let left = queue.first!.1, right = queue.last!.1

        result = max(result, Int(right - left + 1))

        for _ in 0..<queue.count {
            var (node, i) = queue.removeFirst()
            i = i - left

            if let left = node.left { queue.append((left, 2 * i)) }
            if let right = node.right { queue.append((right, 2 * i + 1)) }
        }
    }

    return result
}