// You are also given an array queries where queries[j] = [uj, vj]. For the jth query, 
// you should answer whether course uj is a prerequisite of course vj or not.
// Return a boolean array answer, where answer[j] is the answer to the jth query.

func checkIfPrerequisite(_ numCourses: Int, _ prerequisites: [[Int]], _ queries: [[Int]]) -> [Bool] {
    var neighbors = Array(repeating: [Int](), count: numCourses)

    for prerequisite in prerequisites {
        neighbors[prerequisite[1]].append(prerequisite[0])            
    }

    var prereq = Array(repeating: Set<Int>(), count: numCourses)

    func dfs(_ course: Int) -> Set<Int> {
        if prereq[course].isEmpty {
            for neighbor in neighbors[course] {
                prereq[course].formUnion(dfs(neighbor))
            }
        }

        prereq[course].insert(course)
        return prereq[course]
    }

    for course in 0..<numCourses {
        dfs(course)
    }

    var result = [Bool]()

    for query in queries {
        result.append(prereq[query[1]].contains(query[0]))
    }

    return result
}

print(checkIfPrerequisite(2, [[1,0]], [[0,1],[1,0]]))
print(checkIfPrerequisite(2, [], [[1,0],[0,1]]))
print(checkIfPrerequisite(3, [[1,2],[1,0],[2,0]], [[1,0],[1,2]]))