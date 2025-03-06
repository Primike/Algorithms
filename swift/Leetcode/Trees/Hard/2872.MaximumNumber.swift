// A valid split of the tree is obtained by removing any set of edges, 
// possibly empty, from the tree such that the resulting components 
// all have values that are divisible by k, where the value of a 
// connected component is the sum of the values of its nodes.
// Return the maximum number of components in any valid split.

func maxKDivisibleComponents(_ n: Int, _ edges: [[Int]], _ values: [Int], _ k: Int) -> Int {
    var adjList = Array(repeating: [Int](), count: n)
    for edge in edges {
        adjList[edge[0]].append(edge[1])
        adjList[edge[1]].append(edge[0])
    }

    var componentCount = 0

    func dfs(_ currentNode: Int, _ parentNode: Int) -> Int {
        var sum = 0

        for neighbor in adjList[currentNode] {
            if neighbor != parentNode {
                sum += dfs(neighbor, currentNode)
                sum %= k
            }
        }

        sum += values[currentNode]
        sum %= k

        if sum == 0 {
            componentCount += 1
        }

        return sum
    }

    dfs(0, -1)
    return componentCount
}

print(maxKDivisibleComponents(5, [[0,2],[1,2],[1,3],[2,4]], [1,8,1,4,4], 6))
print(maxKDivisibleComponents(7, [[0,1],[0,2],[1,3],[1,4],[2,5],[2,6]], [3,0,6,1,5,2,1], 3))