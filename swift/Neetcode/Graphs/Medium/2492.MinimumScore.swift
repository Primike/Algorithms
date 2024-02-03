// Return the minimum possible score of a path between cities 1 and n.

// Time: O(n), Space: O(n)
func minScore(_ n: Int, _ roads: [[Int]]) -> Int {
    var neighbors = Array(repeating: [(Int, Int)](), count: n + 1)

    for road in roads {
        neighbors[road[0]].append((road[1], road[2]))
        neighbors[road[1]].append((road[0], road[2]))
    }

    var visited = Set<Int>()

    func dfs(_ n: Int) -> Int {
        if visited.contains(n) { return .max }

        visited.insert(n)
        var result = Int.max

        for (node, cost) in neighbors[n] {
            result = min(result, dfs(node), cost)
        }

        return result
    }

    return dfs(1)
}

print(minScore(4, [[1,2,9],[2,3,6],[2,4,5],[1,4,7]]))
print(minScore(4, [[1,2,2],[1,3,4],[3,4,7]]))