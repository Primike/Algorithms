// Return the index of the node that can be reached from both node1 and node2, 
// such that the maximum between the distance from node1 to that node, 
// and from node2 to that node is minimized. If there are multiple answers, 
// return the node with the smallest index, and if no possible answer exists, return -1.

// Time: O(n), Space: O(n)
func closestMeetingNode(_ edges: [Int], _ node1: Int, _ node2: Int) -> Int {
    func dfs(_ n: Int, _ count: Int, _ visited: inout [Int: Int]) {
        if n == -1 || visited.keys.contains(n) { return }

        visited[n] = count
        dfs(edges[n], count + 1, &visited)
    }

    var node1Paths = [Int: Int](), node2Paths = [Int: Int]()
    dfs(node1, 0, &node1Paths)
    dfs(node2, 0, &node2Paths)
    
    var length = Int.max
    var result = -1

    for i in 0..<edges.count {
        if let path1 = node1Paths[i], let path2 = node2Paths[i] {
            let distance = max(path1, path2)

            if distance < length {
                result = i
                length = distance
            }
        }
    }
    
    return result
}

print(closestMeetingNode([2,2,3,-1], 0, 1))
print(closestMeetingNode([1,2,-1], 0, 2))