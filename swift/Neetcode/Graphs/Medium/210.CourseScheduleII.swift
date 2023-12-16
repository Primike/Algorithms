// Return the ordering of courses you should take to finish all courses. 
// If there are many valid answers, return any of them. 
// If it is impossible to finish all courses, return an empty array.

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var paths = Array(repeating: [Int](), count: numCourses)

    for path in prerequisites {
        paths[path[0]].append(path[1])
    }

    var visited = Set<Int>(), completed = Set<Int>()
    var result = [Int]()

    func dfs(_ n: Int) -> Bool {
        if visited.contains(n) { return false }
        if completed.contains(n) { return true }

        visited.insert(n)

        for path in paths[n] {
            if !dfs(path) { return false }
        }

        visited.remove(n)
        completed.insert(n)
        result.append(n)
        
        return true
    }

    for i in 0..<numCourses {
        if !dfs(i) { return [] }
    }

    return result
}

print(findOrder(2, [[1,0]]))
print(findOrder(4, [[1,0],[2,0],[3,1],[3,2]]))
print(findOrder(1, []))