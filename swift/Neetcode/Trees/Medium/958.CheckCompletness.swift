// Given the root of a binary tree, determine if it is a complete binary tree.

// Time: O(n), Space: O(w)
func isCompleteTree(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }

    var queue: [TreeNode?] = [root]
    var null = false

    while !queue.isEmpty {
        let node = queue.removeFirst()

        if null { return false }
        queue.append(node?.left)
        queue.append(node?.right)

        if node == nil { null = true }
    }

    return true
}

func isCompleteTree2(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }

    var queue = [root]
    var null = false
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let first = queue.removeFirst()

            if let left = first.left { 
                if null { return false }
                queue.append(left)
            } else {
                null = true
            }

            if let right = first.right {
                if null { return false }
                queue.append(right)
            } else {
                null = true
            }
        }
    }

    return true
}