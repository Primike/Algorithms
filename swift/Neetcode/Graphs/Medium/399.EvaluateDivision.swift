// You are given an array of variable pairs equations and an array of 
// real numbers values, where equations[i] = [Ai, Bi] and values[i] 
// represent the equation Ai / Bi = values[i]. 
// Each Ai or Bi is a string that represents a single variable.
// You are also given some queries, where queries[j] = [Cj, Dj] 
// represents the jth query where you must find the answer for Cj / Dj = ?.
// Return the answers to all queries. If a single answer cannot be determined, return -1.0.

func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
    var neighbors = [String: [(String, Double)]]()

    for (equation, value) in zip(equations, values) {
        neighbors[equation[0], default: []].append((equation[1], value))
        neighbors[equation[1], default: []].append((equation[0], 1.0 / value))
    }

    func bfs(_ letter: String, _ target: String) -> Double {
        if target == letter { return 1 }

        var queue = [(letter, 1.0)]
        var visited = Set([letter])

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let (first, value) = queue.removeFirst()

                for (alpha, multiplier) in neighbors[first, default: []] {
                    if visited.contains(alpha) { continue }
                    if alpha == target { return value * multiplier }

                    visited.insert(alpha)
                    queue.append((alpha, value * multiplier))
                }
            }
        }

        return -1
    }

    var result = Array(repeating: -1.0, count: queries.count)

    for (i, query) in queries.enumerated() {
        if neighbors[query[0]] == nil || neighbors[query[1]] == nil { continue }
        result[i] = bfs(query[0], query[1])
    }

    return result
}

print(calcEquation([
    ["a","b"],["b","c"]], 
    [2.0,3.0], 
    [["a","c"],["b","a"],["a","e"],["a","a"],["x","x"]]))
print(calcEquation([
    ["a","b"],["b","c"],["bc","cd"]], 
    [1.5,2.5,5.0], 
    [["a","c"],["c","b"],["bc","cd"],["cd","bc"]]))
print(calcEquation([
    ["a","b"]], 
    [0.5], 
    [["a","b"],["b","a"],["a","c"],["x","y"]]))