// You are given an initial computer network connections. You can extract 
// certain cables between two directly connected computers, and place them 
// between any pair of disconnected computers to make them directly connected.
// Return the minimum number of times you need to do this in order to make 
// all the computers connected. If it is not possible, return -1.

// Time: O(n + e), Space: O(n)
func makeConnected(_ n: Int, _ connections: [[Int]]) -> Int {
    if n > connections.count + 1 { return -1 }

    var roots = Array(0..<n)
    var rank = Array(repeating: 1, count: n)

    func getRoot(_ node: Int) -> Int {
        var node = node

        while node != roots[node] {
            roots[node] = roots[roots[node]]
            node = roots[node]
        }

        return node
    }

    func merge(_ n1: Int, _ n2: Int) {
        let p1 = getRoot(n1), p2 = getRoot(n2) 

        if p1 == p2 { return }

        if rank[p1] >= rank[p2] {
            rank[p1] += rank[p2]
            roots[p2] = p1
        } else {
            rank[p2] += rank[p1]
            roots[p1] = p2
        }
    }

    for connection in connections {
        merge(connection[0], connection[1])
    }

    return roots.enumerated().filter { $0.element == $0.offset }.count - 1
}

print(makeConnected(4, [[0,1],[0,2],[1,2]]))
print(makeConnected(6, [[0,1],[0,2],[0,3],[1,2],[1,3]]))
print(makeConnected(6, [[0,1],[0,2],[0,3],[1,2]]))


func makeConnected2(_ n: Int, _ connections: [[Int]]) -> Int {
    if n > connections.count + 1 { return -1 }
    
    var neighbors = Array(repeating: [Int](), count: n)

    for connection in connections {
        neighbors[connection[0]].append(connection[1])
        neighbors[connection[1]].append(connection[0])
    }

    var visited = Set<Int>()

    func dfs(_ n: Int) {
        if visited.contains(n) { return }

        visited.insert(n)

        for node in neighbors[n] {
            dfs(node)
        }
    }

    var result = -1

    for i in 0..<neighbors.count {
        if !visited.contains(i) { result += 1 }
        dfs(i) 
    }

    return result
}