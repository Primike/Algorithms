// Given the root of a binary tree, 
// return the level order traversal of its nodes' values. 
// (i.e., from left to right, level by level).

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    var result = [[Int]]()
    var queue = [TreeNode]()

    if let root = root { queue.append(root) }

    while !queue.isEmpty {
        var values = [Int]()

        for _ in 0..<queue.count {
            let popped = queue.removeFirst()
            values.append(popped.val)

            if let left = popped.left {
                queue.append(left)
            }
            if let right = popped.right {
                queue.append(right)
            }
        }
        
        result.append(values)
    }
    
    return result
}
