func minimumDiameterAfterMerge(_ edges1: [[Int]], _ edges2: [[Int]]) -> Int {
    let n = edges1.count + 1
    let m = edges2.count + 1
    
    func buildAdjList(_ size: Int, _ edges: [[Int]]) -> [[Int]] {
        var adjList = Array(repeating: [Int](), count: size)
        for edge in edges {
            adjList[edge[0]].append(edge[1])
            adjList[edge[1]].append(edge[0])
        }
        return adjList
    }
    
    func findFarthestNode(_ n: Int, _ adjList: [[Int]], _ sourceNode: Int) -> (Int, Int) {
        var queue = [sourceNode]
        var visited = Array(repeating: false, count: n)
        visited[sourceNode] = true
        var maximumDistance = 0
        var farthestNode = sourceNode
        
        while !queue.isEmpty {
            for _ in 0..<queue.count {
                let currentNode = queue.removeFirst()
                farthestNode = currentNode
                
                for neighbor in adjList[currentNode] {
                    if !visited[neighbor] {
                        visited[neighbor] = true
                        queue.append(neighbor)
                    }
                }
            }
            if !queue.isEmpty {
                maximumDistance += 1
            }
        }
        
        return (farthestNode, maximumDistance)
    }
    
    func findDiameter(_ n: Int, _ adjList: [[Int]]) -> Int {
        let (farthestNode, _) = findFarthestNode(n, adjList, 0)
        let (_, diameter) = findFarthestNode(n, adjList, farthestNode)
        return diameter
    }
    
    let adjList1 = buildAdjList(n, edges1)
    let adjList2 = buildAdjList(m, edges2)
    let diameter1 = findDiameter(n, adjList1)
    let diameter2 = findDiameter(m, adjList2)
    let combinedDiameter = (diameter1 + 1) / 2 + (diameter2 + 1) / 2 + 1
    
    return max(diameter1, diameter2, combinedDiameter)
}