// In one semester, you can take any number of courses as long as you have 
// taken all the prerequisites in the previous semester for the courses you are taking.
// Return the minimum number of semesters needed to take all courses. 
// If there is no way to take all the courses, return -1.

// Time: O(n + e), Space: O(n + e)
func minimumSemesters(_ n: Int, _ relations: [[Int]]) -> Int {
    var paths = Array(repeating: [Int](), count: n + 1)
    
    for relation in relations {
        paths[relation[0]].append(relation[1])
    }

    var finished = [Int: Int]()
    var visited = Set<Int>()

    func dfs(_ n: Int) -> (Int, Bool) {
        if visited.contains(n) { return (0, false) }
        if let value = finished[n] { return (value, true) }

        visited.insert(n)
        var longest = 0

        for node in paths[n] {
            let (count, bool) = dfs(node)

            if !bool { return (0, false) }
            longest = max(longest, count)
        }

        longest += 1
        finished[n] = longest
        visited.remove(n)
        return (longest, true)
    }

    var result = 0

    for i in 1..<paths.count {
        let (count, bool) = dfs(i)
        if !bool { return -1 }

        result = max(result, count)
    }

    return result
}

print(minimumSemesters(3, [[1,3],[2,3]]))
print(minimumSemesters(3, [[1,2],[2,3],[3,1]]))