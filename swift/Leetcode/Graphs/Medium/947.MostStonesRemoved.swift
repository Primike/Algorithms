// On a 2D plane, we place n stones at some integer coordinate points. 
// Each coordinate point may have at most one stone.
// A stone can be removed if it shares either the same row or 
// the same column as another stone that has not been removed.
// Given an array stones of length n where stones[i] = [xi, yi] 
// represents the location of the ith stone, 
// return the largest possible number of stones that can be removed.

// Time: O(n^2), Space: O(n^2)
func removeStones(_ stones: [[Int]]) -> Int {
    var neighbors = Array(repeating: [Int](), count: stones.count)
    
    for i in 0..<stones.count {
        for j in (i + 1)..<stones.count {
            if stones[i][0] == stones[j][0] || stones[i][1] == stones[j][1] {
                neighbors[i].append(j)
                neighbors[j].append(i)
            }
        }
    }
    
    var visited = Set<Int>()
    
    func dfs(_ node: Int) {
        visited.insert(node)

        for next in neighbors[node] {
            if !visited.contains(next) { dfs(next) }
        }
    }
    
    var result = 0

    for i in 0..<stones.count {
        if visited.contains(i) { continue }
        
        dfs(i)
        result += 1
    }
    
    return stones.count - result
}

print(removeStones([[0,0],[0,1],[1,0],[1,2],[2,1],[2,2]]))
print(removeStones([[0,0],[0,2],[1,1],[2,0],[2,2]]))
print(removeStones([[0,0]]))