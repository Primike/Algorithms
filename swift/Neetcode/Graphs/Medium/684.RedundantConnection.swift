// Return an edge that can be removed so that the resulting graph is a tree of n nodes. 
// If there are multiple answers, return the answer that occurs last in the input.

// Time: O(e)/O(n), Space: O(n)
func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    var root = Array(0..<edges.count + 1)
    var rank = Array(repeating: 1, count: edges.count + 1)

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
        if !mergeRoots(edge[0], edge[1]) { return [edge[0], edge[1]] }
    }

    return [0, 0]
}

print(findRedundantConnection([[1,2],[1,3],[2,3]]))
print(findRedundantConnection([[1,2],[2,3],[3,4],[1,4],[1,5]]))