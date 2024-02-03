// A graph is bipartite if the nodes can be partitioned into two independent sets A and B 
// such that every edge in the graph connects a node in set A and a node in set B.
// Return true if and only if it is bipartite.

// Time: O(n + e), Space: O(n)
func isBipartite(_ graph: [[Int]]) -> Bool {
    var colors = Array(repeating: "X", count: graph.count)

    func dfs(_ n: Int, _ color: String) -> Bool {
        if colors[n] != "X" { return colors[n] == color }
        
        colors[n] = color
                    
        for node in graph[n] {
            if !dfs(node, color == "B" ? "R" : "B") { return false }
        }
        
        return true
    }
    
    for i in 0..<graph.count {
        if colors[i] == "X", !dfs(i, "B") { return false }
    }
    
    return true
}

print(isBipartite([[1,2,3],[0,2],[0,1,3],[0,2]]))
print(isBipartite([[1,3],[0,2],[1,3],[0,2]]))