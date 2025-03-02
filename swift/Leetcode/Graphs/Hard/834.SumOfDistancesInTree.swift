// There is an undirected connected tree with n nodes labeled from 
// 0 to n - 1 and n - 1 edges.
// You are given the integer n and the array edges where edges[i] = [ai, bi] 
// indicates that there is an edge between nodes ai and bi in the tree.
// Return an array answer of length n where answer[i] is the 
// sum of the distances between the ith node in the tree and all other nodes.

// Time: O(n), Space: O(n)
func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
    var neighbors = Array(repeating: [Int](), count: n)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    var count = Array(repeating: 1, count: n)
    var result = Array(repeating: 0, count: n)

    func dfs(_ node: Int, _ parent: Int) {
        for next in neighbors[node] {
            if next == parent { continue }

            dfs(next, node)
            count[node] += count[next]
            result[node] += result[next] + count[next]
        }
    }

    func dfs2(_ node: Int, _ parent: Int) {
        for next in neighbors[node] {
            if next == parent { continue }

            result[next] = result[node] - count[next] + n - count[next]
            dfs2(next, node)
        }
    }

    dfs(0, -1)
    dfs2(0, -1)
    return result
}

print(sumOfDistancesInTree(6, [[0,1],[0,2],[2,3],[2,4],[2,5]]))
print(sumOfDistancesInTree(1, []))
print(sumOfDistancesInTree(2, [[1,0]]))