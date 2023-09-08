// Return an edge that can be removed so that the resulting graph is a tree of n nodes. 
// If there are multiple answers, return the answer that occurs last in the input.

func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
    var parents = Array(0..<edges.count + 1)
    var rank = Array(repeating: 1, count: edges.count + 1)

    func find(_ n: Int) -> Int {
        var parent = parents[n]

        while parent != parents[parent] {
            parents[parent] = parents[parents[parent]]
            parent = parents[parent]
        }
        
        return parent
    }

    func union(_ n1: Int, _ n2: Int) -> Bool {
        let (p1, p2) = (find(n1), find(n2))

        if p1 == p2 { return false }

        if rank[p1] > rank[p2] {
            parents[p2] = p1
            rank[p1] += rank[p2]
        } else {
            parents[p1] = p2
            rank[p2] += rank[p1]
        }

        return true
    }

    for edge in edges {
        if !union(edge[0], edge[1]) { return [edge[0], edge[1]] }
    }
    
    return []
}

print(findRedundantConnection([[1,2],[1,3],[2,3]]))
print(findRedundantConnection([[1,2],[2,3],[3,4],[1,4],[1,5]]))