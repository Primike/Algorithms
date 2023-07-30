// There are a total of numCourses courses you have to take, 
// labeled from 0 to numCourses - 1. You are given an array prerequisites 
// where prerequisites[i] = [ai, bi] indicates that you must take course 
// bi first if you want to take course ai.
// Return true if you can finish all courses. Otherwise, return false.

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var preMap = Array(repeating: [Int](), count: numCourses)

    for prerequisite in prerequisites {
        preMap[prerequisite[0]].append(prerequisite[1])
    }

    var visited = Set<Int>()

    func dfs(_ course: Int) -> Bool {
        if visited.contains(course) { return false }
        if preMap[course].isEmpty { return true }

        visited.insert(course)

        for prerequisite in preMap[course] {
            if !dfs(prerequisite) { return false }
        }

        visited.remove(course)
        preMap[course] = []
        return true
    }

    for i in 0..<numCourses {
        if !dfs(i) { return false }
    }

    return true
}

print(canFinish(2, [[1,0]]))
print(canFinish(2, [[1,0],[0,1]]))