// Given a reference of a node in a connected undirected graph.
// Return a deep copy (clone) of the graph.
// Each node in the graph contains a value (int) and a list
// (List[Node]) of its neighbors.

// Time: n * e, Space: n
func cloneGraph(_ node: Node?) -> Node? {
    var nodes = [Int: Node]()

    func dfs(_ node: Node?) -> Node? {
        guard let node = node else { return nil }

        if let stored = nodes[node.val] { return stored }

        let newNode = Node(node.val)
        nodes[node.val] = newNode

        for neighbor in node.neighbors {
            newNode.neighbors.append(dfs(neighbor))
        }  

        return newNode
    }

    return dfs(node)
}

func cloneGraph(_ node: Node?) -> Node? {
    guard let node = node else { return nil }

    var dict = [node: Node(node.val)]
    var queue = [node] 

    while !queue.isEmpty {
        let first = queue.removeFirst()
        let newNode = dict[first]! 

        for neighbor in first.neighbors {
            guard let neighbor = neighbor else { continue }

            if dict[neighbor] == nil {
                dict[neighbor] = Node(neighbor.val)
                queue.append(neighbor) 
            }

            newNode.neighbors.append(dict[neighbor]!)
        }
    }

    return dict[node]
}