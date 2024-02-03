// Find the smallest set of vertices from which all nodes in the graph are reachable. 
// It's guaranteed that a unique solution exists.

// Time: O(n + e), Space: O(n)
func findSmallestSetOfVertices(_ n: Int, _ edges: [[Int]]) -> [Int] {
    var visited = Set(Array(0..<n))

    for edge in edges {
        visited.remove(edge[1])
    }

    return Array(visited)
}

print(findSmallestSetOfVertices(6, [[0,1],[0,2],[2,5],[3,4],[4,2]]))
print(findSmallestSetOfVertices(5, [[0,1],[2,1],[3,1],[1,4],[2,4]]))