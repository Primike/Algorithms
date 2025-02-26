// You are also given a 2D integer array edges, where edges[i] = [fromi, toi] 
// denotes that there is a unidirectional edge from fromi to toi in the graph.
// Return a list answer, where answer[i] is the list of ancestors 
// of the ith node, sorted in ascending order.

// Time: O(n^2), Space: O(n + e)
func getAncestors(_ n: Int, _ edges: [[Int]]) -> [[Int]] {
    var paths = Array(repeating: [Int](), count: n)
    
    for edge in edges {
        paths[edge[1]].append(edge[0])
    }

    var memo = [Int: Set<Int>]()

    func dfs(_ node: Int) -> Set<Int> {
        if let value = memo[node] { return value }

        var ancestors = Set<Int>()

        for next in paths[node] {
            ancestors.formUnion(dfs(next))
            ancestors.insert(next)
        }

        memo[node] = ancestors
        return ancestors
    }

    var result = [[Int]]()

    for i in 0..<n {
        result.append(Array(dfs(i)).sorted())
    }

    return result
}

print(getAncestors(8, [[0,3],[0,4],[1,3],[2,4],[2,7],[3,5],[3,6],[3,7],[4,6]]))
print(getAncestors(5, [[0,1],[0,2],[0,3],[0,4],[1,2],[1,3],[1,4],[2,3],[2,4],[3,4]]))