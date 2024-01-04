// In a town, there are n people labeled from 1 to n. 
// There is a rumor that one of these people is secretly the town judge.
// If the town judge exists, then: The town judge trusts nobody.
// Everybody (except for the town judge) trusts the town judge.
// There is exactly one person that satisfies properties 1 and 2.
// Return the label of the town judge if the town judge exists 
// and can be identified, or return -1 otherwise.

func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
    if trust.isEmpty, n == 1 { return n }

    var paths = Array(repeating: [Int](), count: n + 1)

    for path in trust {
        paths[path[0]].append(path[1])
    }

    var deadEnds = [Int: Int]()

    for i in 1..<paths.count {
        if !paths[i].isEmpty { continue }
        deadEnds[i] = 0
    }

    for node in paths {
        for path in node {
            if !deadEnds.keys.contains(path) { continue }
            deadEnds[path, default: 0] += 1
            if deadEnds[path]! == n - 1 { return path }
        }
    }

    return -1
}

print(findJudge(2, [[1,2]]))
print(findJudge(3, [[1,3],[2,3]]))
print(findJudge(3, [[1,3],[2,3],[3,1]]))