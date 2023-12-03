// Return true if the edges of the given graph make up a valid tree, 
// and false otherwise.

func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
    if edges.count != n - 1 { return false }

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
    
    func union(_ n1: Int, _ n2: Int) -> Bool {
        var p1 = find(n1), p2 = find(n2)

        if p1 == p2 { return false }

        if rank[p1] < rank[p2] {
            parents[p1] = p2
            rank[p2] += rank[p1]
        } else {
            parents[p2] = p1
            rank[p1] += rank[p2]
        }

        return true
    }

    for edge in edges {
        if !union(edge[0], edge[1]) { return false }
    }

    return true
}

print(validTree(5, [[0,1],[0,2],[0,3],[1,4]]))
print(validTree(5, [[0,1],[1,2],[2,3],[1,3],[1,4]]))


func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
    if edges.count != n - 1 { return false }

    var neighbors = Array(repeating: [Int](), count: n)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    var visited = Set<Int>()

    func dfs(_ n: Int, _ parent: Int) -> Bool {
        if visited.contains(n) { return false } 

        visited.insert(n)

        for node in neighbors[n] {
            if node != parent, !dfs(node, n) { return false }
        }

        return true
    }

    if !dfs(0, -1) { return false }

    return visited.count == n
}