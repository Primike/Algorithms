// Return the ordering of courses you should take to finish all courses. 
// If there are many valid answers, return any of them. 
// If it is impossible to finish all courses, return an empty array.

func findOrder(_ numCourses: Int, _ prerequisites: [[Int]]) -> [Int] {
    var neighbors = Array(repeating: [Int](), count: numCourses)

    for prerequisite in prerequisites {
        neighbors[prerequisite[0]].append(prerequisite[1])
    }

    var visited = Set<Int>(), completed = Set<Int>()
    var result = [Int]()

    func dfs(_ course: Int) -> Bool {
        if visited.contains(course) { return false }
        if completed.contains(course) { return true }

        visited.insert(course)

        for neighbor in neighbors[course] {
            if !dfs(neighbor) { return false }
        }

        visited.remove(course)
        completed.insert(course)
        result.append(course)
        
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