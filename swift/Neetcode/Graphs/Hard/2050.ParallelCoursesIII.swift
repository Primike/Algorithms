// You are given an integer n, which indicates that there are n courses 
// labeled from 1 to n. You are also given a 2D integer array relations 
// where relations[j] = [prevCoursej, nextCoursej]
// time[i] denotes how many months it takes to complete the (i+1)th course.
// You may start taking a course at any time if the prerequisites are met.
// Any number of courses can be taken at the same time.
// Return the minimum number of months needed to complete all the courses.

// Time: O(n + e), Space: O(n + e)
func minimumTime(_ n: Int, _ relations: [[Int]], _ time: [Int]) -> Int {
    var roots = Set(1...n)
    var paths = Array(repeating: [Int](), count: n + 1)

    for path in relations {
        paths[path[0]].append(path[1])
        roots.remove(path[1])
    }

    var memo = [Int: Int]()

    func dfs(_ n: Int) -> Int {
        if let value = memo[n] { return value }
        
        var longest = 0

        for node in paths[n] {
            longest = max(longest, dfs(node))
        }

        longest += time[n - 1]
        memo[n] = longest
        return longest
    }

    var result = 0

    for n in roots {
        result = max(result, dfs(n))
    }

    return result
}

print(minimumTime(3, [[1,3],[2,3]], [3,2,5]))
print(minimumTime(5, [[1,5],[2,5],[3,5],[3,4],[4,5]], [1,2,3,4,5]))