// You are also given an array queries where queries[j] = [uj, vj]. For the jth query, 
// you should answer whether course uj is a prerequisite of course vj or not.
// Return a boolean array answer, where answer[j] is the answer to the jth query.

// Time: O(n + e), Space: O(n)
func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
    var paths = Array(repeating: Set<Int>(), count: numCourses)

    for courses in prerequisites {
        paths[courses[0]].insert(courses[1])
    }

    var visited = Set<Int>()

    func dfs(_ course: Int) -> Set<Int> {
        if visited.contains(course) { return paths[course] }

        visited.insert(course)

        for next in paths[course] {
            paths[course].formUnion(dfs(next)) 
        }

        return paths[course]
    }

    for course in 0..<paths.count {
        dfs(course)
    }

    var result = [Bool]()

    for query in queries {
        result.append(paths[query[0]].contains(query[1]))
    }

    return result
}

print(checkIfPrerequisite(2, [[1,0]], [[0,1],[1,0]]))
print(checkIfPrerequisite(2, [], [[1,0],[0,1]]))
print(checkIfPrerequisite(3, [[1,2],[1,0],[2,0]], [[1,0],[1,2]]))