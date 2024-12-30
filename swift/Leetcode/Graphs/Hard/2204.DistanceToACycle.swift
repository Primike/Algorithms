// You are given a positive integer n representing the number 
// of nodes in a connected undirected graph containing exactly one cycle. 
// The nodes are numbered from 0 to n - 1 (inclusive).
// You are also given a 2D integer array edges, 
// where edges[i] = [node1i, node2i] denotes that there is a 
// bidirectional edge connecting node1i and node2i in the graph.
// The distance between two nodes a and b is defined to be the 
// minimum number of edges that are needed to go from a to b.
// Return an integer array answer of size n, where answer[i] 
// is the minimum distance between the ith node and any node in the cycle.

func distanceToCycle(_ n: Int, _ edges: [[Int]]) -> [Int] {
    var neighbors = Array(repeating: [Int](), count: n)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    var visited = Set<Int>()

    func dfs(_ node: Int, _ parent: Int) -> Int {
        if visited.contains(node) { return node }

        visited.insert(node)

        for next in neighbors[node] {
            if next == parent { continue }
            
            let value = dfs(next, node)
            if value != -1 { return value }
        }

        return -1
    }

    let cycleNode = dfs(0, -1)
    visited = []

    func findCycleNodes(_ node: Int, _ parent: Int) -> Bool {
        if visited.contains(node) { return true }

        visited.insert(node)

        for next in neighbors[node] {
            if next == parent { continue }
            if findCycleNodes(next, node) { return true }
        }

        visited.remove(node)
        return false
    }

    findCycleNodes(cycleNode, -1)
    var result = Array(repeating: 0, count: n)
    var queue = Array(visited)
    var distance = 1

    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let first = queue.removeFirst()

            for next in neighbors[first] {
                if visited.contains(next) { continue }

                result[next] = distance
                visited.insert(next)
                queue.append(next)
            }
        }

        distance += 1
    }

    return result
}

print(distanceToCycle(7, [[1,2],[2,4],[4,3],[3,1],[0,1],[5,2],[6,5]]))
print(distanceToCycle(9, [[0,1],[1,2],[0,2],[2,6],[6,7],[6,8],[0,3],[3,4],[3,5]]))