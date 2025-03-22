class Solution {
    var parent: [Int] = []
    var depth: [Int] = []
    
    func minimumCost(_ n: Int, _ edges: [[Int]], _ queries: [[Int]]) -> [Int] {
        parent = Array(repeating: -1, count: n)
        depth = Array(repeating: 0, count: n)
        var componentCost = Array(repeating: -1, count: n)
        
        for edge in edges {
            _union(edge[0], edge[1])
        }
        
        for edge in edges {
            let root = _find(edge[0])
            componentCost[root] &= edge[2]
        }
        
        var answer: [Int] = []
        for query in queries {
            let start = query[0]
            let end = query[1]
            if _find(start) != _find(end) {
                answer.append(-1)
            } else {
                let root = _find(start)
                answer.append(componentCost[root])
            }
        }
        
        return answer
    }
    
    func _find(_ node: Int) -> Int {
        if parent[node] == -1 {
            return node
        }
        parent[node] = _find(parent[node])
        return parent[node]
    }
    
    func _union(_ node1: Int, _ node2: Int) {
        var root1 = _find(node1)
        var root2 = _find(node2)
        
        if root1 == root2 {
            return
        }
        
        if depth[root1] < depth[root2] {
            swap(&root1, &root2)
        }
        
        parent[root2] = root1
        
        if depth[root1] == depth[root2] {
            depth[root1] += 1
        }
    }
}