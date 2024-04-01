// You are given a perfect binary tree where all leaves are on the same level, 
// and every parent has two children. Populate each next pointer to point to 
// its next right node. If there is no next right node, 
// the next pointer should be set to NULL.

func connect(_ root: Node?) -> Node? {
    var node = root
    var nextLevel = node?.left

    while node !== nil, nextLevel !== nil  {
        node!.left?.next = node!.right
        node!.right?.next = node!.next?.left

        node = node!.next

        if node === nil {
            node = nextLevel
            nextLevel = node?.left
        }
    }

    return root
}

func connect2(_ root: Node?) -> Node? {
    guard let root = root else { return root }

    root.right?.next = root.next?.left
    root.left?.next = root.right

    connect(root.left)
    connect(root.right)

    return root
}

func connect3(_ root: Node?) -> Node? {
    guard let root = root else { return nil }

    var queue = [root]

    while !queue.isEmpty {
        let count = queue.count

        for i in 0..<count {
            let first = queue.removeFirst()

            if i < count - 1 { first.next = queue[0] }
            if let left = first.left { queue.append(left) }
            if let right = first.right { queue.append(right) }
        }
    }

    return root
}