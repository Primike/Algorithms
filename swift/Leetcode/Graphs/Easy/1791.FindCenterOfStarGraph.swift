// There is an undirected star graph consisting of n nodes 
// labeled from 1 to n. A star graph is a graph where 
// there is one center node and exactly n - 1 edges that 
// connect the center node with every other node.
// You are given a 2D integer array edges where each 
// edges[i] = [ui, vi] indicates that there is an edge between 
// the nodes ui and vi. Return the center of the given star graph.

// Time: O(n), Space: O(n)
func findCenter(_ edges: [[Int]]) -> Int {
    var neighbors = Array(repeating: [Int](), count: edges.count + 2)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    for (n, nodes) in neighbors.enumerated() {
        if nodes.count > 1 { return n }
    }

    return 0
}

print(findCenter([[1,2],[2,3],[4,2]]))
print(findCenter([[1,2],[5,1],[1,3],[1,4]]))