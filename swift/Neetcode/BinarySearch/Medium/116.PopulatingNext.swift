// You are given a perfect binary tree where all leaves are on the same level, 
// and every parent has two children. Populate each next pointer to point to 
// its next right node. If there is no next right node, 
// the next pointer should be set to NULL.

func connect(_ root: Node?) -> Node? {
    guard let root = root else { return nil }

    var current: Node? = root
    var next = root.left

    while let currentLevelNode = current, next != nil {
        if let left = currentLevelNode.left, let right = currentLevelNode.right {
            left.next = right

            if let nextNode = currentLevelNode.next {
                right.next = nextNode.left
            }
        }
        
        current = currentLevelNode.next

        if current == nil {
            current = next
            next = current?.left
        }
    }

    return root
}