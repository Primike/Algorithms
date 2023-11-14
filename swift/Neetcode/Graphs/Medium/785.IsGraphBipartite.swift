// A graph is bipartite if the nodes can be partitioned into two independent sets A and B 
// such that every edge in the graph connects a node in set A and a node in set B.
// Return true if and only if it is bipartite.

func isBipartite(_ graph: [[Int]]) -> Bool {
    var colors = [Character](repeating: "X", count: graph.count)

    func dfs(_ node: Int, _ color: Character) -> Bool {
        if colors[node] != "X" { return colors[node] == color }
        
        colors[node] = color
                    
        for neighbor in graph[node] {
            if !dfs(neighbor, color == "B" ? "R" : "B") { return false }
        }
        
        return true
    }
    
    for i in 0..<graph.count {
        if colors[i] == "X" && !dfs(i, "B") { return false }
    }
    
    return true
}

print(isBipartite([[1,2,3],[0,2],[0,1,3],[0,2]]))
print(isBipartite([[1,3],[0,2],[1,3],[0,2]]))