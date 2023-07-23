// Given the root of a binary tree, 
// imagine yourself standing on the right side of it, 
// return the values of the nodes you can see ordered from top to bottom.

func rightSideView(_ root: TreeNode?) -> [Int] {
    var result = [Int]()
    var queue = [TreeNode]()

    if let root = root { queue.append(root) }

    while !queue.isEmpty {
        let count = queue.count

        for i in 0..<count {
            let popped = queue.removeFirst()

            if let left = popped.left {
                queue.append(left)
            }
            if let right = popped.right {
                queue.append(right)
            }

            if i == count - 1 {
                result.append(popped.val)
            }
        }
    }

    return result
}
