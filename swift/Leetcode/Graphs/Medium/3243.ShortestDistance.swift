// There are n cities numbered from 0 to n - 1. 
// Initially, there is a unidirectional road from 
// city i to city i + 1 for all 0 <= i < n - 1.
// queries[i] = [ui, vi] represents the addition of a 
// new unidirectional road from city ui to city vi. 
// After each query, you need to find the length of the 
// shortest path from city 0 to city n - 1.
// Return an array answer where for each i in the range 
// [0, queries.length - 1], answer[i] is the length 
// of the shortest path from city 0 to city n - 1 
// after processing the first i + 1 queries.

// Time: O(q * (n + q)), Space: O(q * n)
func shortestDistanceAfterQueries(_ n: Int, _ queries: [[Int]]) -> [Int] {
    var paths = Array(repeating: [Int](), count: n)
    
    for i in 0..<(n - 1){
        paths[i].append(i + 1)
    }
    
    var memo = [Int: Int]()

    func dfs(_ node: Int) -> Int {
        if node == n - 1 { return 0 }
        if let value = memo[node] { return value }
        
        var shortest = n

        for next in paths[node] {
            shortest = min(shortest, dfs(next) + 1)
        }
        
        memo[node] = shortest
        return shortest
    }

    var result = [Int]()
    
    for query in queries {
        paths[query[0]].append(query[1])
        result.append(dfs(0))
        memo = [:]
    }
    
    return result
}

print(shortestDistanceAfterQueries(5, [[2,4],[0,2],[0,4]]))
print(shortestDistanceAfterQueries(4, [[0,3],[0,2]]))