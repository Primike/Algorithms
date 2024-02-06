// In a town, there are n people labeled from 1 to n. 
// There is a rumor that one of these people is secretly the town judge.
// If the town judge exists, then: The town judge trusts nobody.
// Everybody (except for the town judge) trusts the town judge.
// There is exactly one person that satisfies properties 1 and 2.
// Return the label of the town judge if the town judge exists 
// and can be identified, or return -1 otherwise.

// Time: O(n), Space: O(n)
func findJudge(_ n: Int, _ trust: [[Int]]) -> Int {
    if trust.isEmpty, n == 1 { return n }
    
    var trusts = Array(repeating: [Int](), count: n + 1)
    var trustees = Array(repeating: 0, count: n + 1)

    for path in trust {
        trusts[path[0]].append(path[1])
        trustees[path[1]] += 1
    }

    var maximum = trustees.max() ?? 1
    if maximum < n - 1 || trustees.filter { $0 == maximum }.count != 1 { return -1 }

    for i in 1...n {
        if trusts[i].isEmpty, trustees[i] == maximum { return i }
    }

    return -1
}

print(findJudge(2, [[1,2]]))
print(findJudge(3, [[1,3],[2,3]]))
print(findJudge(3, [[1,3],[2,3],[3,1]]))