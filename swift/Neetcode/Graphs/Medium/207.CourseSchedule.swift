// There are a total of numCourses courses you have to take, 
// labeled from 0 to numCourses - 1. You are given an array prerequisites 
// where prerequisites[i] = [ai, bi] indicates that you must take course 
// bi first if you want to take course ai.
// Return true if you can finish all courses. Otherwise, return false.

func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var edges = Array(repeating: [Int](), count: numCourses)

    for path in prerequisites {
        edges[path[1]].append(path[0])
    }

    var visited = Set<Int>()

    func dfs(_ n: Int) -> Bool {
        if visited.contains(n) { return false }
        if edges[n].isEmpty { return true }

        visited.insert(n)

        for edge in edges[n] {
            if !dfs(edge) { return false }
        }

        visited.remove(n)
        edges[n] = []

        return true
    }

    for i in 0..<edges.count {
        if !dfs(i) { return false }
    }

    return true
}

print(canFinish(2, [[1,0]]))
print(canFinish(2, [[1,0],[0,1]]))