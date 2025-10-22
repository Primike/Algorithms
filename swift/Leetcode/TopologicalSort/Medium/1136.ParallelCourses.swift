// In one semester, you can take any number of courses as long as you have 
// taken all the prerequisites in the previous semester for the courses you are taking.
// Return the minimum number of semesters needed to take all courses. 
// If there is no way to take all the courses, return -1.

// Time: O(n + e), Space: O(n + e)
func minimumSemesters(_ n: Int, _ relations: [[Int]]) -> Int {
    var paths = [Int: [Int]]()

    for relation in relations {
        paths[relation[0], default: []].append(relation[1])
    }

    var memo = [Int: Int]()
    var visited = Set<Int>()
    var hasCycle = false

    func dfs(_ node: Int) -> Int {
        if let value = memo[node] { return value }
        if visited.contains(node) { 
            hasCycle = true
            return 0
        }

        visited.insert(node)
        var longestPath = 0

        for next in paths[node, default: []] {
            longestPath = max(longestPath, dfs(next))
        }

        longestPath += 1
        visited.remove(node)
        memo[node] = longestPath
        return longestPath
    }
    
    var result = 0

    for node in 1...n {
        result = max(result, dfs(node))
        if hasCycle { return -1 }
    }

    return result
}

print(minimumSemesters(3, [[1,3],[2,3]]))
print(minimumSemesters(3, [[1,2],[2,3],[3,1]]))