// Return the number of complete connected components of the graph.
// A connected component is a subgraph of a graph in which 
// there exists a path between any two vertices, 
// and no vertex of the subgraph shares an edge with a 
// vertex outside of the subgraph.
// A connected component is said to be complete 
// if there exists an edge between every pair of its vertices.

// Time: O(n), Space: O(n)
func countCompleteComponents(_ n: Int, _ edges: [[Int]]) -> Int {
    var neighbors = Array(repeating: [Int](), count: n)
    
    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    var visited = Set<Int>()

    func dfs(_ node: Int) -> [Int] {
        var array = [node]
        visited.insert(node)

        for next in neighbors[node] {
            if visited.contains(next) { continue }
            array += dfs(next)
        }

        return array
    }

    var graphs = [[Int]]()

    for i in 0..<n {
        if visited.contains(i) { continue }
        graphs.append(dfs(i))
    }

    var result = 0

    for i in 0..<graphs.count {
        var isComplete = true 

        for node in graphs[i] {
            if neighbors[node].count < graphs[i].count - 1 { 
                isComplete = false 
                break
            }
        }

        if isComplete { result += 1 }
    }

    return result
}

print(countCompleteComponents(6, [[0,1],[0,2],[1,2],[3,4]]))
print(countCompleteComponents(6, [[0,1],[0,2],[1,2],[3,4],[3,5]]))