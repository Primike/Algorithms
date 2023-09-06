// A node is a terminal node if there are no outgoing edges. A node is a safe node if 
// every possible path starting from that node leads to a terminal node (or another safe node).
// Return an array containing all the safe nodes of the graph. 
// The answer should be sorted in ascending order.

func eventualSafeNodes(_ graph: [[Int]]) -> [Int] {
    var n = graph.count
    var safe = [Int: Bool]()

    func dfs(_ i: Int) -> Bool {
        if let isSafe = safe[i] { return isSafe }

        safe[i] = false
        for path in graph[i] {
            if !dfs(path) { return safe[i, default: false] }
        }
        safe[i] = true
        return safe[i, default: true]
    }

    var result = [Int]()

    for i in 0..<n {
        if dfs(i) { result.append(i) }
    }
    
    return result
}

print(eventualSafeNodes([[1,2],[2,3],[5],[0],[5],[],[]]))
print(eventualSafeNodes([[1,2,3,4],[1,2],[3,4],[0,4],[]]))