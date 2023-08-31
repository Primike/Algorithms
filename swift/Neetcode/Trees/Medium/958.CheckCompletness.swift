// Given the root of a binary tree, determine if it is a complete binary tree.

func isCompleteTree(_ root: TreeNode?) -> Bool {
    guard let root = root else { return true }

    var queue: [TreeNode?] = [root]
    var nilEncountered = false

    while !queue.isEmpty {
        let node = queue.removeFirst()

        if nilEncountered { return false }
        queue.append(node?.left)
        queue.append(node?.right)

        if node == nil { nilEncountered = true }
    }

    return true
}