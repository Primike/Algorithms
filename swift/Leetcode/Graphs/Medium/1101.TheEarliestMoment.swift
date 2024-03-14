// There are n people in a social group labeled from 0 to n - 1. 
// You are given an array logs where logs[i] = [timestampi, xi, yi] 
// indicates that xi and yi will be friends at the time timestampi.
// Friendship is symmetric. That means if a is friends with b, 
// then b is friends with a. Also, person a is acquainted with a person b 
// if a is friends with b, or a is a friend of someone acquainted with b.
// Return the earliest time for which every person became acquainted 
// with every other person. If there is no such earliest time, return -1.

func earliestAcq(_ logs: [[Int]], _ n: Int) -> Int {
    var roots = Array(0..<n)
    var rank = Array(repeating: 1, count: n)
    var disjointSets = n

    func getRoot(_ node: Int) -> Int {
        var node = node

        while node != roots[node] {
            roots[node] = roots[roots[node]]
            node = roots[node]                
        }

        return node
    }

    func merge(_ n1: Int, _ n2: Int) -> Bool {
        let p1 = getRoot(n1), p2 = getRoot(n2)

        if p1 == p2 { return false }

        disjointSets -= 1

        if rank[p1] > rank[p2] {
            roots[p2] = p1
            rank[p1] += rank[p2]
        } else {
            roots[p1] = p2
            rank[p2] += rank[p1]
        }

        return true
    }

    let logs = logs.sorted { $0[0] < $1[0] }
    var result = logs[0][0]

    for log in logs {
        if merge(log[1], log[2]) { result = log[0] }
    }

    return disjointSets == 1 ? result : -1
}

print(earliestAcq([
    [20190101,0,1],[20190104,3,4],[20190107,2,3],
    [20190211,1,5],[20190224,2,4],[20190301,0,3],
    [20190312,1,2],[20190322,4,5]], 6))
print(earliestAcq([
    [0,2,0],[1,0,1],[3,0,3],[4,1,2],[7,3,1]], 4))