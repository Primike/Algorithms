// Return true if the edges of the given graph make up a valid tree, 
// and false otherwise.

// Time: O(n + e), Space: O(n)
func validTree(_ n: Int, _ edges: [[Int]]) -> Bool {
    var root = Array(0..<n)
    var rank = Array(repeating: 1, count: n)

    func getRoot(_ n: Int) -> Int {
        var n = root[n]

        while n != root[n] {
            root[n] = root[root[n]]
            n = root[n]
        }

        return n
    }

    func mergeRoots(_ n1: Int, _ n2: Int) -> Bool {
        let p1 = getRoot(n1), p2 = getRoot(n2)

        if p1 == p2 { return false }

        if rank[p1] >= rank[p2] {
            root[p2] = p1
            rank[p1] += rank[p2]
        } else {
            root[p1] = p2
            rank[p2] += rank[p1]
        }

        return true
    }

    for edge in edges {
        if !mergeRoots(edge[0], edge[1]) { return false }
    }

    return true
}

print(validTree(5, [[0,1],[0,2],[0,3],[1,4]]))
print(validTree(5, [[0,1],[1,2],[2,3],[1,3],[1,4]]))


func validTree2(_ n: Int, _ edges: [[Int]]) -> Bool {
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
            if node == parent { continue }
            if !dfs(node, n) { return false }
        }

        return true
    }

    if !dfs(0, -1) { return false }
    
    return visited.count == n
}