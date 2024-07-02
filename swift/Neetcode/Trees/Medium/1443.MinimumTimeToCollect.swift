// Given an undirected tree consisting of n vertices numbered from 0 to n-1,
// which has some apples in their vertices. 
// You spend 1 second to walk over one edge of the tree. 
// Return the minimum time in seconds you have to spend to collect 
// all apples in the tree, starting at vertex 0 and coming back to this vertex.

// Time: O(n), Space: O(h)
func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
    var neighbors = Array(repeating: [Int](), count: n)

    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    var result = 0
    
    func dfs(_ n: Int, _ parent: Int) -> Bool {
        var count = 0

        for node in neighbors[n] {
            if node == parent { continue }
            if dfs(node, n) { count += 1 }
        }

        result += count * 2
        return count >= 1 || hasApple[n]
    }

    dfs(0, -1)
    return result
}

print(minTime(7,
    [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]],
    [false,false,true,false,true,true,false]))
print(minTime(7, 
    [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], 
    [false,false,true,false,false,true,false]))
print(minTime(7, 
    [[0,1],[0,2],[1,4],[1,5],[2,3],[2,6]], 
    [false,false,false,false,false,false,false]))