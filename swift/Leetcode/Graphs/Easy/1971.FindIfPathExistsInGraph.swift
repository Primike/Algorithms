// There is a bi-directional graph with n vertices, 
// where each vertex is labeled from 0 to n - 1 (inclusive). 
// Given edges and the integers n, source, and destination, 
// return true if there is a valid path from source to destination,
// or false otherwise.

// Time: O(n + e), Space: O(n + e)
func validPath(_ n: Int, _ edges: [[Int]], _ source: Int, _ destination: Int) -> Bool {
    var neighbors = Array(repeating: [Int](), count: n)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    var visited = Set<Int>()

    func dfs(_ n: Int) -> Bool {
        if visited.contains(n) { return false }
        if n == destination { return true }

        visited.insert(n)

        for node in neighbors[n] {
            if dfs(node) { return true }
        }

        return false
    }

    return dfs(source)
}

print(validPath(3, [[0,1],[1,2],[2,0]], 0, 2))
print(validPath(6, [[0,1],[0,2],[3,5],[5,4],[4,3]], 0, 5))