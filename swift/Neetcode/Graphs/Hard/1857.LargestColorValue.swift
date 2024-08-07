// Return the largest color value of any valid path in the given graph, 
// or -1 if the graph contains a cycle.

func largestPathValue(_ colors: String, _ edges: [[Int]]) -> Int {
    let colors = Array(colors)
    var paths = Array(repeating: [Int](), count: colors.count)
    var roots = Set(0..<colors.count)

    for edge in edges {
        paths[edge[0]].append(edge[1])
        roots.remove(edge[1])
    }

    var memo = Array(repeating: Array(repeating: 0, count: 26), count: colors.count)
    var visited = Set<Int>()
    var completed = Set<Int>()
    var result = 0

    func dfs(_ node: Int) -> Bool {
        if visited.contains(node) { return false }  
        if completed.contains(node) { return true }  

        visited.insert(node)
        var count = Array(repeating: 0, count: 26)

        for next in paths[node] {
            if !dfs(next) { return false }
            count = zip(count, memo[next]).map(max)
        }

        visited.remove(node)
        completed.insert(node)
        count[Int(colors[node].asciiValue!) - 97] += 1
        result = max(result, count.max() ?? 0)
        
        memo[node] = count
        return true
    }

    for root in roots {
        if !dfs(root) { return -1 }
    }

    return completed.count == colors.count ? result : -1
}

print(largestPathValue("abaca", [[0,1],[0,2],[2,3],[3,4]]))
print(largestPathValue("a", [[0,0]]))


// Kahns Algorithm
func largestPathValue2(_ colors: String, _ edges: [[Int]]) -> Int {
    let colors = Array(colors)
    var degrees = Array(repeating: 0, count: colors.count)
    var paths = Array(repeating: [Int](), count: colors.count)
    var counts = Array(repeating: [Int](repeating: 0, count: 26), count: colors.count)

    for edge in edges {
        paths[edge[0]].append(edge[1])
        degrees[edge[1]] += 1
    }

    var queue = [Int]()

    for i in 0..<degrees.count {
        if degrees[i] == 0 {
            queue.append(i)
            counts[i][Int(colors[i].asciiValue! - 97)] = 1
        }
    }

    var result = 0

    while !queue.isEmpty {
        let n = queue.removeFirst()
        result = max(result, counts[n].max()!)

        for node in paths[n] {
            for i in 0..<26 {
                let isColor = (i == Int(colors[node].asciiValue! - 97)) ? 1 : 0
                counts[node][i] = max(counts[node][i], counts[n][i] + isColor)
            }

            degrees[node] -= 1
            if degrees[node] == 0 { queue.append(node) }
        }
    }

    for degrees in degrees {
        if degrees > 0 { return -1 }
    }

    return result
}