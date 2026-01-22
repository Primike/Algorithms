class Solution {
    private func getEdges(_ fences: [Int], _ border: Int) -> Set<Int> {
        let points = ([1, border] + fences).sorted()
        var edges = Set<Int>()
        
        for i in 0..<points.count {
            for j in (i + 1)..<points.count {
                edges.insert(points[j] - points[i])
            }
        }
        return edges
    }

    func maximizeSquareArea(_ m: Int, _ n: Int, _ hFences: [Int], _ vFences: [Int]) -> Int {
        let MOD = 1_000_000_007
        let hEdges = getEdges(hFences, m)
        let vEdges = getEdges(vFences, n)
        
        let commonEdges = hEdges.intersection(vEdges)
        
        if let maxEdge = commonEdges.max() {
            return (maxEdge * maxEdge) % MOD
        }
        
        return -1
    }
}