// Your task consists of reorienting some roads such that each city can visit the city 0. 
// Return the minimum number of edges changed.

// Time: O(n), Space: O(n)
func minReorder(_ n: Int, _ connections: [[Int]]) -> Int {
    var neighbors = Array(repeating: [(Int, Bool)](), count: n)

    for connection in connections {
        neighbors[connection[0]].append((connection[1], false))
        neighbors[connection[1]].append((connection[0], true))
    }

    var visited = Set<Int>()

    func dfs(_ n: Int) -> Int {
        visited.insert(n)
        var result = 0

        for (node, isPathFrom) in neighbors[n] {
            if visited.contains(node) { continue }
            if !isPathFrom { result += 1 }

            result += dfs(node)
        }

        return result
    }

    return dfs(0)
}

print(minReorder(6, [[0,1],[1,3],[2,3],[4,0],[4,5]]))
print(minReorder(5, [[1,0],[1,2],[3,2],[3,4]]))
print(minReorder(3, [[1,0],[2,0]]))