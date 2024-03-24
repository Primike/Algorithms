// Given the root of a binary tree, return the maximum width of the given tree.

// Time: O(n), Space: O(w)
func widthOfBinaryTree(_ root: TreeNode?) -> Int {
    guard let root = root else { return 0 }

    var result = 0
    var queue = [(root, 0)]

    while !queue.isEmpty {
        let start = queue.first!.1
        let end = queue.last!.1

        result = max(result, Int(end - start + 1))

        for _ in 0..<queue.count {
            var (node, i) = queue.removeFirst()
            i = i - start

            if let left = node.left { queue.append((left, i * 2)) }
            if let right = node.right { queue.append((right, i * 2 + 1)) }
        }
    }

    return result
}