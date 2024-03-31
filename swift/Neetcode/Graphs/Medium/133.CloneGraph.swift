// Given a reference of a node in a connected undirected graph.
// Return a deep copy (clone) of the graph.
// Each node in the graph contains a value (int) and a list
// (List[Node]) of its neighbors.

// Time: O(n * e), Space: O(n)
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

func cloneGraph2(_ node: Node?) -> Node? {
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

func cloneGraph3(_ node: Node?) -> Node? {
    var nodeToCopy = [Node: Node]()

    func createCopies(_ node: Node?) {
        guard let node = node else { return }
        if nodeToCopy.keys.contains(node) { return }

        nodeToCopy[node] = Node(node.val)

        for n in node.neighbors {
            createCopies(n)
        }
    }

    var visited = Set<Int>()

    func connectCopies(_ node: Node?) {
        guard let node = node else { return }
        guard let copy = nodeToCopy[node] else { return }

        visited.insert(node.val)

        for n in node.neighbors {
            guard let neighbor = n else { continue }
            guard let neighborCopy = nodeToCopy[neighbor] else { continue }

            copy.neighbors.append(neighborCopy)

            if visited.contains(neighbor.val) { continue }
            connectCopies(neighbor)
        }
    }

    createCopies(node)
    connectCopies(node)

    return nodeToCopy[node ?? Node(-1)]
}