// Given a reference of a node in a connected undirected graph.
// Return a deep copy (clone) of the graph.
// Each node in the graph contains a value (int) and a list
// (List[Node]) of its neighbors.

func cloneGraph(_ node: Node?) -> Node? {
    var mapping = [Int: Node]()

    func dfs(_ node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }

        if let existingNode = mapping[node.val] {
            return existingNode
        }

        let new = Node(node.val)
        mapping[new.val] = new

        for neighbor in node.neighbors {
            new.neighbors.append(dfs(neighbor))
        }  

        return new
    }

    return dfs(node)
}
