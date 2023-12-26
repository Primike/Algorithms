// Your task consists of reorienting some roads such that each city can visit the city 0. 
// Return the minimum number of edges changed.

// Time: n + e, Space: n + e
func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
    var neighbors = Array(repeating: [Int](), count: n)
    var edges = Set<String>()

    for connection in connections {
        neighbors[connection[0]].append(connection[1])
        neighbors[connection[1]].append(connection[0])
        edges.insert("\(connection[1]),\(connection[0])")
    }        

    var visited = Set<Int>()
    var result = 0
    
    func dfs(_ n: Int) {
        visited.insert(n)

        for neighbor in neighbors[n] {
            if visited.contains(neighbor) { continue }
            if !edges.contains("\(n),\(neighbor)") { result += 1 }
            dfs(neighbor)
        }
    }

    dfs(0)
    return result
}

print(minReorder(6, [[0,1],[1,3],[2,3],[4,0],[4,5]]))
print(minReorder(5, [[1,0],[1,2],[3,2],[3,4]]))
print(minReorder(3, [[1,0],[2,0]]))