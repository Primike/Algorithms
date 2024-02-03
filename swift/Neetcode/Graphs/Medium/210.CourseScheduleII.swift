// Return the ordering of courses you should take to finish all courses. 
// If there are many valid answers, return any of them. 
// If it is impossible to finish all courses, return an empty array.

// Time: O(n + e), Space: O(n)
func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var paths = Array(repeating: [Int](), count: numCourses)

    for classes in prerequisites {
        paths[classes[0]].append(classes[1])
    }

    var courses = [Int: Bool]()
    var visited = Set<Int>()
    var result = [Int]()

    func dfs(_ n: Int) -> Bool {
        if let value = courses[n] { return value }
        if visited.contains(n) { return false }

        visited.insert(n)
        var canFinish = true
        
        for node in paths[n] {
            if !dfs(node) { canFinish = false }
        }
        
        result.append(n)
        courses[n] = canFinish
        return canFinish
    }
    
    for i in 0..<numCourses {
        if !dfs(i)  { return [] }
    }

    return result
}

print(findOrder(2, [[1,0]]))
print(findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))
print(findOrder(1, []))