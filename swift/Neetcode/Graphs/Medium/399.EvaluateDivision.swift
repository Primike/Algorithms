// You are given an array of variable pairs equations and an array of 
// real numbers values, where equations[i] = [Ai, Bi] and values[i] 
// represent the equation Ai / Bi = values[i]. 
// Each Ai or Bi is a string that represents a single variable.
// You are also given some queries, where queries[j] = [Cj, Dj] 
// represents the jth query where you must find the answer for Cj / Dj = ?.
// Return the answers to all queries. If a single answer cannot be determined, return -1.0.

// Uses stoichiometry
func calcEquation(_ equations: [[String]], _ values: [Double], _ queries: [[String]]) -> [Double] {
    var dict = [String: [(String, Double)]]()

    for (index, equation) in equations.enumerated() {
        let a = equation[0], b = equation[1]
        dict[a, default: []].append((b, values[index]))
        dict[b, default: []].append((a, 1 / values[index]))
    }
    
    func bfs(_ numerator: String, _ denominator: String) -> Double {
        if dict[numerator] == nil || dict[denominator] == nil { return -1 }

        var queue = [(numerator, 1.0)]
        var visited = Set([numerator])

        while !queue.isEmpty {
            let (node, current) = queue.removeFirst()
            if node == denominator { return current }

            for (n, weight) in dict[node, default: []] {
                if visited.contains(n) { continue }

                queue.append((n, current * weight))
                visited.insert(n)
            }
        }
        
        return -1
    }

    return queries.map { bfs($0[0], $0[1]) }
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