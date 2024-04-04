class Codec {
    func serialize(_ root: TreeNode?) -> String {
        guard let root = root else { return "" }

        var result = [String]()
        var queue: [TreeNode?] = [root]

        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            if let node = node {
                result.append("\(node.val)")
                queue.append(node.left)
                queue.append(node.right)
            } else {
                result.append("null")
            }
        }

        return result.joined(separator: ",")
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        if data.isEmpty { return nil }
        
        let data = data.split(separator: ",")
        var queue: [TreeNode?] = []
        let root = TreeNode(Int(data[0]) ?? 0)
        queue.append(root)
        var i = 1
        
        while !queue.isEmpty, i < data.count {
            let node = queue.removeFirst()
            
            if data[i] != "null" {
                let left = TreeNode(Int(data[i]) ?? 0)
                node?.left = left
                queue.append(left)
            }

            i += 1
            
            if i < data.count, data[i] != "null" {
                let right = TreeNode(Int(data[i]) ?? 0)
                node?.right = right
                queue.append(right)
            }
            
            i += 1
        }
        
        return root
    }
}