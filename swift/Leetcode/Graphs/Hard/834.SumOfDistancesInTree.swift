// There is an undirected connected tree with n nodes labeled from 
// 0 to n - 1 and n - 1 edges.
// You are given the integer n and the array edges where edges[i] = [ai, bi] 
// indicates that there is an edge between nodes ai and bi in the tree.
// Return an array answer of length n where answer[i] is the 
// sum of the distances between the ith node in the tree and all other nodes.

func sumOfDistancesInTree(_ n: Int, _ edges: [[Int]]) -> [Int] {
    var neighbors = Array(repeating: [Int](), count: n)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    var count = Array(repeating: 1, count: n)
    var result = Array(repeating: 0, count: n)

    func dfs(_ node: Int, _ parent: Int) {
        for child in neighbors[node] {
            if child == parent { continue }

            dfs(child, node)
            count[node] += count[child]
            result[node] += result[child] + count[child]
        }
    }

    func dfs2(_ node: Int, _ parent: Int) {
        for child in neighbors[node] {
            if child == parent { continue }

            result[child] = result[node] - count[child] + n - count[child]
            dfs2(child, node)
        }
    }

    dfs(0, -1)
    dfs2(0, -1)
    return result
}

print(sumOfDistancesInTree(6, [[0,1],[0,2],[2,3],[2,4],[2,5]]))
print(sumOfDistancesInTree(1, []))
print(sumOfDistancesInTree(2, [[1,0]]))