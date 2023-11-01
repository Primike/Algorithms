// Given an undirected tree consisting of n vertices numbered from 0 to n-1,
// which has some apples in their vertices. 
// You spend 1 second to walk over one edge of the tree. 
// Return the minimum time in seconds you have to spend to collect 
// all apples in the tree, starting at vertex 0 and coming back to this vertex.

func minTime(_ n: Int, _ edges: [[Int]], _ hasApple: [Bool]) -> Int {
    var neighbors = Array(repeating: [Int](), count: n)
    
    for edge in edges {
        neighbors[edge[0]].append(edge[1])
        neighbors[edge[1]].append(edge[0])
    }

    var visited = Set<Int>()

    func dfs(_ n: Int, _ count: Int) -> (Bool, Int) {
        if visited.contains(n) { return (false, count) }

        visited.insert(n)
        var apple = hasApple[n]
        var path = count + 1

        for neighbor in neighbors[n] {
            let (containsApple, value) = dfs(neighbor, 1)
            
            if containsApple { 
                path += value 
                apple = true
            }
        }

        return apple ? (true, path) : (false, path)
    }

    return dfs(0, 0).1 - 1
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