// Given the root of a binary tree, 
// imagine yourself standing on the right side of it, 
// return the values of the nodes you can see ordered from top to bottom.

// Time: O(n), Space: O(w)
func rightSideView(_ root: TreeNode?) -> [Int] {
    guard let root = root else { return [] }

    var result = [Int]()
    var queue = [root]

    while !queue.isEmpty {
        let count = queue.count

        for i in 0..<count {
            let first = queue.removeFirst()

            if let left = first.left { queue.append(left) }
            if let right = first.right { queue.append(right) }
            if i == count - 1 { result.append(first.val) }
        }
    }

    return result
}