// Return the index of the node that can be reached from both node1 and node2, 
// such that the maximum between the distance from node1 to that node, 
// and from node2 to that node is minimized. If there are multiple answers, 
// return the node with the smallest index, and if no possible answer exists, return -1.

func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
    func bfs(_ node: Int, _ distanceMap: inout [Int: Int]) {
        var queue = [(node, 0)]
        distanceMap[node] = 0

        while !queue.isEmpty {
            let (node, distance) = queue.removeFirst()

            if edges[node] != -1 , !distanceMap.keys.contains(edges[node]) {
                queue.append((edges[node], distance + 1))
                distanceMap[edges[node]] = distance + 1
            }
        }
    }

    var node1Dist = [Int: Int](), node2Dist = [Int: Int]()
    bfs(node1, &node1Dist)
    bfs(node2, &node2Dist)

    var result = -1, resultDistance = Int.max

    for i in 0..<edges.count {
        if let d1 = node1Dist[i], let d2 = node2Dist[i] {
            var distance = max(d1, d2)

            if distance < resultDistance {
                result = i
                resultDistance = distance
            }
        }
    }

    return result
}

print(closestMeetingNode([2,2,3,-1], 0, 1))
print(closestMeetingNode([1,2,-1], 0, 2))