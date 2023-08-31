// Given the root of a binary tree, 
// imagine yourself standing on the right side of it, 
// return the values of the nodes you can see ordered from top to bottom.

func rightSideView(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }

    var result = [Int]()
    var queue = [root]

    while !queue.isEmpty {
        let currentCount = queue.count - 1

        for i in 0..<queue.count {
            let node = queue.removeFirst()

            if let left = node.left { queue.append(left) }
            if let right = node.right { queue.append(right) }

            if i == currentCount { result.append(node.val) }
        }
    }

    return result
}