// Type 1: Can be traversed by Alice only.
// Type 2: Can be traversed by Bob only.
// Type 3: Can be traversed by both Alice and Bob.
// Given an array edges where edges[i] = [typei, ui, vi] represents 
// a bidirectional edge of type typei between nodes ui and vi, 
// find the maximum number of edges you can remove so that after removing the edges, 
// the graph can still be fully traversed by both Alice and Bob. 
// The graph is fully traversed by Alice and Bob if starting from any node, 
// they can reach all other nodes.
// Return the maximum number of edges you can remove, or return -1 
// if Alice and Bob cannot fully traverse the graph.

func maxNumEdgesToRemove(_ n: Int, _ edges: [[Int]]) -> Int {
    func getRoot(_ n: Int, _ root: inout [Int]) -> Int {
        var n = n

        while n != root[n] {
            root[n] = root[root[n]]
            n = root[n]
        }

        return n
    }

    func mergeRoots(_ n1: Int, _ n2: Int, _ root: inout [Int], _ rank: inout [Int]) -> Bool {
        let p1 = getRoot(n1, &root), p2 = getRoot(n2, &root)

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

    var aliceRoot = Array(0...n)
    var aliceRank = Array(repeating: 1, count: n + 1)
    var bobRoot = Array(0...n)
    var bobRank = Array(repeating: 1, count: n + 1)
    var result = 0

    for edge in edges.filter { $0[0] == 3 } {
        let mergeAlice = mergeRoots(edge[1], edge[2], &aliceRoot, &aliceRank)
        let mergeBob = mergeRoots(edge[1], edge[2], &bobRoot, &bobRank)

        if !mergeAlice || !mergeBob { result += 1 }
    }

    for edge in edges {
        if edge[0] == 1 {
            let mergeAlice = mergeRoots(edge[1], edge[2], &aliceRoot, &aliceRank)
            if !mergeAlice { result += 1 }
        } else if edge[0] == 2 {
            let mergeBob = mergeRoots(edge[1], edge[2], &bobRoot, &bobRank)
            if !mergeBob { result += 1 }
        }
    }

    let aliceComponents = aliceRoot.indices.filter { $0 > 0 && aliceRoot[$0] == $0 }.count
    let bobComponents = bobRoot.indices.filter { $0 > 0 && bobRoot[$0] == $0 }.count
    if aliceComponents > 1 || bobComponents > 1 { return -1 }

    return result
}

print(maxNumEdgesToRemove(4, [[3,1,2],[3,2,3],[1,1,3],[1,2,4],[1,1,2],[2,3,4]]))
print(maxNumEdgesToRemove(4, [[3,1,2],[3,2,3],[1,1,4],[2,1,4]]))
print(maxNumEdgesToRemove(4, [[3,2,3],[1,1,2],[2,3,4]]))