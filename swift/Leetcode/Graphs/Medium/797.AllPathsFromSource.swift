// Given a directed acyclic graph (DAG) of n nodes labeled from 0 to n - 1, 
// find all possible paths from node 0 to node n - 1 and return them in any order.

// Time: O(2^n * n), Space: O(n)
func allPathsSourceTarget(_ graph: [[Int]]) -> [[Int]] {
    var result = [[Int]]()
    var current = [0]

    func dfs(_ node: Int) {
        if node == graph.count - 1 { result.append(current) }

        for next in graph[node] {
            current.append(next)
            dfs(next)
            current.removeLast()
        }
    }

    dfs(0)
    return result
}

print(allPathsSourceTarget([[1,2],[3],[3],[]]))
print(allPathsSourceTarget([[4,3,1],[3,2,4],[3],[4],[]]))