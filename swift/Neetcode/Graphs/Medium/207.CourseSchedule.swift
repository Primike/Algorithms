// There are a total of numCourses courses you have to take, 
// labeled from 0 to numCourses - 1. You are given an array prerequisites 
// where prerequisites[i] = [ai, bi] indicates that you must take course 
// bi first if you want to take course ai.
// Return true if you can finish all courses. Otherwise, return false.

// Time: O(n + e), Space: O(n)
func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var paths = Array(repeating: [Int](), count: numCourses)

    for path in prerequisites {
        paths[path[1]].append(path[0])
    }

    var visited = Set<Int>()

    func dfs(_ n: Int) -> Bool {
        if visited.contains(n) { return false }
        if paths[n].isEmpty { return true }

        visited.insert(n)

        for edge in paths[n] {
            if !dfs(edge) { return false }
        }

        visited.remove(n)
        paths[n] = []

        return true
    }

    for i in 0..<paths.count {
        if !dfs(i) { return false }
    }

    return true
}

print(canFinish(2, [[1,0]]))
print(canFinish(2, [[1,0],[0,1]]))


func canFinish2(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
    var paths = Array(repeating: [Int](), count: numCourses)

    for classes in prerequisites {
        paths[classes[0]].append(classes[1])
    }

    var courses = [Int: Bool]()
    var visited = Set<Int>()

    func dfs(_ n: Int) -> Bool {
        if let value = courses[n] { return value }
        if visited.contains(n) { return false }

        visited.insert(n)
        var canTake = true

        for node in paths[n] {
            if !dfs(node) { canTake = false }
        }

        courses[n] = canTake
        return canTake
    }

    for i in 0..<numCourses {
        if !dfs(i) { return false }
    }

    return true
}