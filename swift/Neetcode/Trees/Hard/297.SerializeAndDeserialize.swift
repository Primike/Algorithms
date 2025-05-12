// Time: O(n), Space: O(n)
class Codec {
    func serialize(_ root: TreeNode?) -> String {
        var result = ""

        func dfs(_ root: TreeNode?) {
            guard let root = root else { 
                result += "nil,"
                return 
            }

            result += "\(root.val),"

            dfs(root.left)
            dfs(root.right)
        }

        dfs(root)
        result.dropLast()
        return result
    }
    
    func deserialize(_ data: String) -> TreeNode? {
        let data = data.components(separatedBy: ",")
        var i = 0

        func dfs() -> TreeNode? {
            if data[i] == "nil" { 
                i += 1
                return nil 
            }

            let newNode = TreeNode(Int(data[i])!)
            i += 1
            newNode.left = dfs()
            newNode.right = dfs()

            return newNode
        }

        return dfs()
    }
}

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