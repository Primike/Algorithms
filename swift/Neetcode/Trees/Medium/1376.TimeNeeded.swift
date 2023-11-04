// Return the number of minutes needed to inform all the employees about the urgent news.

func numOfMinutes(_ n: Int, _ headID: Int, _ manager: [Int], _ informTime: [Int]) -> Int {
    var subordinates = Array(repeating: [Int](), count: n)

    for (n, id) in manager.enumerated() {
        if id != -1 { subordinates[id].append(n) }
    }

    func dfs(_ id: Int, _ time: Int) -> Int {
        if subordinates[id].isEmpty { return time }

        var longestTime = 0

        for n in subordinates[id] {
            longestTime = max(longestTime, dfs(n, time + informTime[id]))
        }

        return longestTime
    }
    
    return dfs(headID, 0)
}

print(numOfMinutes(1, 0, [-1], [0]))
print(numOfMinutes(6, 2, [2,2,-1,2,2,2], [0,0,1,0,0,0]))