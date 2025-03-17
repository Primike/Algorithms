// Divide the nodes of the graph into m groups (1-indexed) such that:
// Each node in the graph belongs to exactly one group.
// For every pair of nodes in the graph that are connected 
// by an edge [ai, bi], if ai belongs to the group with index x, 
// and bi belongs to the group with index y, then |y - x| = 1.
// Return the maximum number of groups (i.e., maximum m) 
// into which you can divide the nodes. 
// Return -1 if it is impossible to group the nodes with the given conditions.

// Time: O(n * (n + e)), Space: O(n + e)
func magnificentSets(_ n: Int, _ edges: [[Int]]) -> Int {
    var neighbors = Array(repeating: [Int](), count: n + 1)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    var colors = Array(repeating: -1, count: n + 1)

    func isBipartite(_ node: Int) -> Bool {
        for next in neighbors[node] {
            if colors[node] == colors[next] { return false }
            if colors[next] != -1 { continue }

            colors[next] = colors[node] == 1 ? 0 : 1       
            if !isBipartite(next) { return false }
        }

        return true
    }

    for i in 1...n {
        if colors[i] != -1 { continue }
        colors[i] = 1
        if !isBipartite(i) { return -1 }
    }

    var longestPaths = Array(repeating: 0, count: n + 1)

    for i in 1...n {
        var visited = Set([i])
        var queue = [i]
        var length = 0

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let first = queue.removeFirst()

                for next in neighbors[first] {
                    if visited.contains(next) { continue }

                    visited.insert(next)
                    queue.append(next)
                }
            }

            length += 1
        }

        longestPaths[i] = length
    }

    func getLongestPathForGraph(_ node: Int) -> Int {
        var maximum = longestPaths[node]
        visited.insert(node)

        for next in neighbors[node] {
            if visited.contains(next) { continue }
            maximum = max(maximum, getLongestPathForGraph(next))
        }

        return maximum
    }

    var result = 0
    var visited = Set<Int>()

    for i in 1...n {
        if visited.contains(i) { continue }
        result += getLongestPathForGraph(i)
    }

    return result
}

print(magnificentSets(6, [[1,2],[1,4],[1,5],[2,6],[2,3],[4,6]]))
print(magnificentSets(3, [[1,2],[2,3],[3,1]]))