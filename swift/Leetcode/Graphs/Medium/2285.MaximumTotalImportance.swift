// You are also given a 2D integer array roads where roads[i] = [ai, bi] 
// denotes that there exists a bidirectional road connecting cities ai and bi.
// You need to assign each city with an integer value from 1 to n, 
// where each value can only be used once. The importance of a road 
// is then defined as the sum of the values of the two cities it connects.
// Return the maximum total importance of all roads possible 
// after assigning the values optimally.

// Time: O(n), Space: O(n)
func maximumImportance(_ n: Int, _ roads: [[Int]]) -> Int {
    var degrees = Array(repeating: 0, count: n)
    
    for road in roads {
        degrees[road[0]] += 1
        degrees[road[1]] += 1
    }
    
    var nodes = [(Int, Int)]()

    for i in 0..<n {
        nodes.append((i, degrees[i]))
    }
    
    nodes.sort { $0.1 > $1.1 }
    var importance = Array(repeating: 0, count: n)

    for i in 0..<nodes.count {
        importance[nodes[i].0] = n - i
    }
    
    var result = 0

    for road in roads {
        result += importance[road[0]] + importance[road[1]]
    }
    
    return result
}

print(maximumImportance(5, [[0,1],[1,2],[2,3],[0,2],[1,3],[2,4]]))
print(maximumImportance(5, [[0,3],[2,4],[1,3]]))