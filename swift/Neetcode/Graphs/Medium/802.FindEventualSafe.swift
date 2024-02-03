// A node is a terminal node if there are no outgoing edges. A node is a safe node if 
// every possible path starting from that node leads to a terminal node (or another safe node).
// Return an array containing all the safe nodes of the graph. 
// The answer should be sorted in ascending order.

// Time: O(n + e), Space: O(n)
func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
    var safeNodes = [Int: Bool]()
    var visited = Set<Int>()

    func dfs(_ n: Int) -> Bool {
        if let value = safeNodes[n] { return value }
        if visited.contains(n) { return false }

        visited.insert(n)
        var isSafe = true

        for node in graph[n] {
            isSafe = isSafe && dfs(node)
        }

        safeNodes[n] = isSafe
        return isSafe
    }

    var result = [Int]()

    for i in 0..<graph.count {
        if dfs(i) { result.append(i) }
    }

    return result
}

print(eventualSafeNodes([[1,2],[2,3],[5],[0],[5],[],[]]))
print(eventualSafeNodes([[1,2,3,4],[1,2],[3,4],[0,4],[]]))