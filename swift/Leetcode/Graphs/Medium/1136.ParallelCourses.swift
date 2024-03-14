// In one semester, you can take any number of courses as long as you have 
// taken all the prerequisites in the previous semester for the courses you are taking.
// Return the minimum number of semesters needed to take all courses. 
// If there is no way to take all the courses, return -1.

// Time: O(n + e), Space: O(n + e)
func minimumSemesters(_ n: Int, _ relations: [[Int]]) -> Int {
    var paths = Array(repeating: [Int](), count: n + 1)

    for relation in relations {
        paths[relation[1]].append(relation[0])
    }

    var visited = Set<Int>()
    var pathLength = [Int: Int]()

    func topological(_ n: Int) -> Bool {
        if visited.contains(n) { return false }
        if pathLength.keys.contains(n) { return true }

        visited.insert(n)
        var length = 0
        
        for node in paths[n] {
            if !topological(node) { return false }

            length = max(length, pathLength[node, default: 0])
        }

        visited.remove(n)
        pathLength[n] = length + 1
        return true
    }

    for node in 1..<paths.count {
        if !topological(node) { return -1 }
    }

    return pathLength.values.max() ?? 0
}

print(minimumSemesters(3, [[1,3],[2,3]]))
print(minimumSemesters(3, [[1,2],[2,3],[3,1]]))