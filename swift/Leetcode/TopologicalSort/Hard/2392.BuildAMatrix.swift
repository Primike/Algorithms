// You are given a positive integer k. You are also given:
// a 2D integer array rowConditions of size n where rowConditions[i] = [abovei, belowi], and
// a 2D integer array colConditions of size m where colConditions[i] = [lefti, righti].
// You have to build a k x k matrix that contains each of the numbers from 1 to k exactly once. 
// The remaining cells should have the value 0.
// The matrix should also satisfy the following conditions:
// The number abovei should appear in a row that is strictly above 
// the row at which the number belowi appears for all i from 0 to n - 1.
// The number lefti should appear in a column that is strictly left 
// of the column at which the number righti appears for all i from 0 to m - 1.
// Return any matrix that satisfies the conditions. 
// If no answer exists, return an empty matrix.

// Time: O(k^2), Space: O(k^2)
func buildMatrix(_ k: Int, _ rowConditions: [[Int]], _ colConditions: [[Int]]) -> [[Int]] {
    func topologicalSort(_ conditions: [[Int]]) -> [Int: Int]? {
        var paths = Array(repeating: [Int](), count: k + 1)
        
        for path in conditions {
            paths[path[0]].append(path[1])
        }
        
        var visited = Set<Int>()
        var completed = Set<Int>()
        var indicies = [Int: Int]()
        var i = k - 1

        func dfs(_ n: Int) -> Bool {
            if completed.contains(n) { return true }
            if visited.contains(n) { return false }
            
            visited.insert(n)
            
            for node in paths[n] {
                if !dfs(node) { return false }
            }
            
            visited.remove(n)
            completed.insert(n)
            indicies[n] = i
            i -= 1

            return true
        }
        
        for n in 1...k {
            if !dfs(n) { return nil }
        }
        
        return indicies
    }
    
    guard let rowOrder = topologicalSort(rowConditions) else { return [] }
    guard let colOrder = topologicalSort(colConditions) else { return [] }
    var result = Array(repeating: Array(repeating: 0, count: k), count: k)
    
    for n in 1...k {
        if let i = rowOrder[n], let j = colOrder[n] { result[i][j] = n }
    }
    
    return result
}

print(buildMatrix(3, [[1,2],[3,2]], [[2,1],[3,2]]))
print(buildMatrix(3, [[1,2],[2,3],[3,1],[2,3]], [[2,1]]))