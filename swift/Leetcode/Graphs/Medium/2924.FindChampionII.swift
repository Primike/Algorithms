// A directed edge from a to b in the graph means that team a 
// is stronger than team b and team b is weaker than team a.
// Team a will be the champion of the tournament 
// if there is no team b that is stronger than team a.
// Return the team that will be the champion of the tournament 
// if there is a unique champion, otherwise, return -1.

// Time: O(e), Space: O(n)
func findChampion(_ n: Int, _ edges: [[Int]]) -> Int {
    var roots = Set(0..<n)

    for edge in edges {
        roots.remove(edge[1])
    }

    if roots.count > 1 { return -1 }
    return Array(roots)[0]
}

print(findChampion(3, [[0,1],[1,2]]))
print(findChampion(4, [[0,2],[1,3],[1,2]]))