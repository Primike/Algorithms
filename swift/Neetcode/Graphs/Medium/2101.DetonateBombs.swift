// Given the list of bombs, return the maximum number of bombs that can be detonated 
// if you are allowed to detonate only one bomb.

func maximumDetonation(_ bombs: [[Int]]) -> Int {
    var visited = Set<Int>()

    func dfs(_ bomb: Int) -> Int {
        if visited.contains(bomb) { return 0 }

        visited.insert(bomb)
        var count = 1

        for j in 0..<bombs.count {
            if j == bomb || visited.contains(j) { continue }

            let xSquared = pow(Double(bombs[bomb][0] - bombs[j][0]), 2)
            let ySquared = pow(Double(bombs[bomb][1] - bombs[j][1]), 2)
            let distance = sqrt(xSquared + ySquared)

            if distance <= Double(bombs[bomb][2]) { count += dfs(j) } 
        }

        return count
    }

    var result = 0

    for i in 0..<bombs.count {
        result = max(result, dfs(i))
        visited = []
    }

    return result
}

print(maximumDetonation([[2,1,3],[6,1,4]]))
print(maximumDetonation([[1,1,5],[10,10,5]]))
print(maximumDetonation([[1,2,3],[2,3,1],[3,4,2],[4,5,3],[5,6,4]]))