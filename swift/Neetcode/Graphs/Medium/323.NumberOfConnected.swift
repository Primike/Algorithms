// Return the number of connected components in the graph.

func countComponents(_ n: Int, _ edges: [[Int]]) -> Int {
    var parents = Array(0..<n)
    var rank = Array(repeating: 1, count: n)

    func find(_ n: Int) -> Int {
        var result = n

        while result != parents[result] {
            parents[result] = parents[parents[result]]
            result = parents[result]
        }

        return result
    }

    func union(_ n1: Int, _ n2: Int) -> Int {
        var p1 = find(n1), p2 = find(n2)

        if p1 == p2 { return 0 }

        if rank[p2] > rank[p1] {
            parents[p1] = p2
            rank[p2] += rank[p1]
        } else {
            parents[p2] = p1
            rank[p1] += rank[p2]
        }

        return 1
    }

    var result = n

    for edge in edges {
        result -= union(edge[0], edge[1])
    }

    return result
}

print(countComponents(5, [[0,1],[1,2],[3,4]]))
print(countComponents(5, [[0,1],[1,2],[2,3],[3,4]]))


func countComponents2(_ n: Int, _ edges: [[Int]]) -> Int {
    var neighbors = Array(repeating: [Int](), count: n)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    var visited = Set<Int>()

    func dfs(_ n: Int) {
        if visited.contains(n) { return }

        visited.insert(n)

        for node in neighbors[n] {
            dfs(node)
        }
    }

    var result = 0

    for n in 0..<neighbors.count {
        if !visited.contains(n) {
            dfs(n)
            result += 1
        }
    }

    return result
}