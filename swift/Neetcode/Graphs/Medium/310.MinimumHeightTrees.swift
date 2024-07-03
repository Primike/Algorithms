// Given a tree of n nodes labelled from 0 to n - 1, 
// and an array of n - 1 edges where edges[i] = [ai, bi] indicates 
// that there is an undirected edge between the two nodes ai and bi 
// in the tree, you can choose any node of the tree as the root. 
// When you select a node x as the root, the result tree has height h. 
// Among all possible rooted trees, those with minimum height (i.e. min(h))  
// are called minimum height trees (MHTs).
// Return a list of all MHTs' root labels. You can return the answer in any order.

// Time: O(n), Space: O(n)
func findMinHeightTrees(_ n: Int, _ edges: [[Int]]) -> [Int] {
    if n == 1 { return [0] }

    var neighbors = Array(repeating: Set<Int>(), count: n)

    for edge in edges {
        neighbors[edge[0]].insert(edge[1])
        neighbors[edge[1]].insert(edge[0])
    }

    var result = [Int]()

    for i in 0..<n {
        if neighbors[i].count == 1 { result.append(i) }
    }

    var nodesToVisit = n

    while nodesToVisit > 2 {
        nodesToVisit -= result.count

        for i in 0..<result.count {
            let currentLeaf = result.removeFirst()

            if let nextLeaf = neighbors[currentLeaf].first {
                neighbors[nextLeaf].remove(currentLeaf)

                if neighbors[nextLeaf].count == 1 { result.append(nextLeaf) }
            }
        }
    }

    return result
}

print(findMinHeightTrees(4, [[1,0],[1,2],[1,3]]))
print(findMinHeightTrees(6, [[3,0],[3,1],[3,2],[3,4],[5,4]]))