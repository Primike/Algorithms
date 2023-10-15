// Return an array answer of length n, where each answer[x] is the length of the 
// shortest path from node 0 to node x such that the edge colors alternate along the path,
// or -1 if such a path does not exist.

func shortestAlternatingPaths(_ n: Int, _ redEdges: [[Int]], _ blueEdges: [[Int]]) -> [Int] {
    var edges = Array(repeating: [(Int, String)](), count: n)
    
    for edge in redEdges {
        edges[edge[0]].append((edge[1], "RED"))
    }
    
    for edge in blueEdges {
        edges[edge[0]].append((edge[1], "BLUE"))
    }
    
    var pathLength = Array(repeating: -1, count: n)
    var visited = Set<String>()
    var queue = [(Int, String)]()
    pathLength[0] = 0
    queue.append((0, ""))
    var length = 1 
    
    while !queue.isEmpty {
        for _ in 0..<queue.count {
            let (n, lastColor) = queue.removeFirst()

            for (nextN, color) in edges[n] {
                if color != lastColor {
                    let key = "\(nextN),\(color)"

                    if !visited.contains(key) {
                        visited.insert(key)
                        queue.append((nextN, color))
                        if pathLength[nextN] == -1 { pathLength[nextN] = length }
                    }
                }
            }
        }
        
        length += 1
    }

    return pathLength
}

print(shortestAlternatingPaths(3, [[0,1],[1,2]], []))
print(shortestAlternatingPaths(3, [[0,1]], [[2,1]]))