// There is an undirected tree of n nodes labeled from 0 to n - 1. 
// You are given a 2D array edges where edges.length == n - 1 and 
// edges[i] = [ai, bi] indicates that there is an undirected edge 
// between nodes ai and bi in the tree.
// Return the diameter of the tree.

// Time: O(n), Space: O(n)
func treeDiameter(_ edges: [[Int]]) -> Int {
    var neighbors = Array(repeating: [Int](), count: edges.count + 1)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    var result = 0

    func dfs(_ n: Int, _ parent: Int) -> Int {
        var longestPath = 0

        for node in neighbors[n] {
            if node == parent { continue }

            let pathLength = dfs(node, n)
            result = max(result, longestPath + pathLength)
            longestPath = max(longestPath, pathLength)
        }

        return longestPath + 1
    }

    dfs(0, -1)
    return result
}

func treeDiameter2(_ edges: [[Int]]) -> Int {
    var neighbors = Array(repeating: [Int](), count: edges.count + 1)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    var lastNode = 0

    func bfs(_ n: Int) -> Int {
        var visited = Set([n])
        var queue = [n]
        var length = 0

        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let first = queue.removeFirst()
                lastNode = first

                for node in neighbors[first] {
                    if visited.contains(node) { continue }

                    visited.insert(node)
                    queue.append(node)
                }
            }

            length += 1
        }

        return length - 1
    }

    bfs(0)
    return bfs(lastNode)
}

print(treeDiameter([[0,1],[0,2]]))
print(treeDiameter([[0,1],[1,2],[2,3],[1,4],[4,5]]))