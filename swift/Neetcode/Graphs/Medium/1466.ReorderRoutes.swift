// Your task consists of reorienting some roads such that each city can visit the city 0. 
// Return the minimum number of edges changed.

func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
    let edges = Set(connections.map { "\($0[0]),\($0[1])" })
    var neighbors = Array(repeating: [Int](), count: n)
    var visited = Set<Int>()
    var flips = 0

    for path in connections {
        neighbors[path[0]].append(path[1])
        neighbors[path[1]].append(path[0])
    }

    func dfs(_ city: Int) {
        for neighbor in neighbors[city] {
            if visited.contains(neighbor) { continue }
            if !edges.contains("\(neighbor),\(city)") { flips += 1 }

            visited.insert(neighbor)
            dfs(neighbor)
        }
    }

    visited.insert(0)
    dfs(0)
    return flips
}

print(minReorder(6, [[0,1],[1,3],[2,3],[4,0],[4,5]]))
print(minReorder(5, [[1,0],[1,2],[3,2],[3,4]]))
print(minReorder(3, [[1,0],[2,0]]))