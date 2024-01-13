// Return the number of minutes needed to inform all the employees about the urgent news.

// Time: O(n), Space: O(n)
func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
    var paths = Array(repeating: [Int](), count: n)

    for i in 0..<manager.count {
        if manager[i] == -1 { continue }
        paths[manager[i]].append(i)
    }

    var result = 0

    func dfs(_ i: Int, _ time: Int) {
        for worker in paths[i] {
            dfs(worker, time + informTime[i])
        }

        result = max(result, time)
    }

    dfs(headID, 0)
    return result
}

print(numOfMinutes(1, 0, [-1], [0]))
print(numOfMinutes(6, 2, [2,2,-1,2,2,2], [0,0,1,0,0,0]))