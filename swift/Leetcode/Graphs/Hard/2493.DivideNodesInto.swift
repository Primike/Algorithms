func magnificentSets(_ n: Int, _ edges: [[Int]]) -> Int {
    var adjList = [[Int]](repeating: [], count: n)
    for edge in edges {
        adjList[edge[0] - 1].append(edge[1] - 1)
        adjList[edge[1] - 1].append(edge[0] - 1)
    }

    var colors = [Int](repeating: -1, count: n)
    for node in 0..<n {
        if colors[node] != -1 { continue }
        colors[node] = 0
        if !isBipartite(adjList, node, &colors) {
            return -1
        }
    }

    let distances = (0..<n).map { getLongestShortestPath(adjList, $0, n) }
    var maxNumberOfGroups = 0
    var visited = [Bool](repeating: false, count: n)
    for node in 0..<n {
        if visited[node] { continue }
        maxNumberOfGroups += getNumberOfGroupsForComponent(adjList, node, distances, &visited)
    }

    return maxNumberOfGroups
}

private func isBipartite(_ adjList: [[Int]], _ node: Int, _ colors: inout [Int]) -> Bool {
    for neighbor in adjList[node] {
        if colors[neighbor] == colors[node] {
            return false
        }
        if colors[neighbor] != -1 {
            continue
        }
        colors[neighbor] = (colors[node] + 1) % 2
        if !isBipartite(adjList, neighbor, &colors) {
            return false
        }
    }
    return true
}

private func getLongestShortestPath(_ adjList: [[Int]], _ srcNode: Int, _ n: Int) -> Int {
    var nodesQueue = [srcNode]
    var visited = [Bool](repeating: false, count: n)
    visited[srcNode] = true
    var distance = 0

    while !nodesQueue.isEmpty {
        for _ in 0..<nodesQueue.count {
            let currentNode = nodesQueue.removeFirst()
            for neighbor in adjList[currentNode] {
                if visited[neighbor] { continue }
                visited[neighbor] = true
                nodesQueue.append(neighbor)
            }
        }
        distance += 1
    }

    return distance
}

private func getNumberOfGroupsForComponent(_ adjList: [[Int]], _ node: Int, _ distances: [Int], _ visited: inout [Bool]) -> Int {
    var maxNumberOfGroups = distances[node]
    visited[node] = true

    for neighbor in adjList[node] {
        if visited[neighbor] { continue }
        maxNumberOfGroups = max(maxNumberOfGroups, getNumberOfGroupsForComponent(adjList, neighbor, distances, &visited))
    }
    return maxNumberOfGroups
}