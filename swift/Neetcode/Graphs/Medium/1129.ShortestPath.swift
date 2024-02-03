// Return an array answer of length n, where each answer[x] is the length of the 
// shortest path from node 0 to node x such that the edge colors alternate along the path,
// or -1 if such a path does not exist.

// Time: O(n), Space: O(n)
func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
    var edges = Array(repeating: [(Int, Int)](), count: n)
    
    for edge in redEdges {
        edges[edge[0]].append((edge[1], 0))
    }
    
    for edge in blueEdges {
        edges[edge[0]].append((edge[1], 1))
    }
    
    var visited = Set<String>()
    var queue = [(0, -1)]
    var result = Array(repeating: -1, count: n)
    result[0] = 0
    var length = 1 
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (n, last) = queue.removeFirst()

            for (node, color) in edges[n] {
                let key = "\(node),\(color)"
                
                if color == last || visited.contains(key) { continue }

                visited.insert(key)
                queue.append((node, color))
                if result[node] == -1 { result[node] = length }
            }
        }
        
        length += 1
    }

    return result
}

print(shortestAlternatingPaths(3, [[0,1],[1,2]], []))
print(shortestAlternatingPaths(3, [[0,1]], [[2,1]]))