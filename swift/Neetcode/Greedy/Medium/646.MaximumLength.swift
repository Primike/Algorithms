// You are given an array of n pairs pairs 
// where pairs[i] = [lefti, righti] and lefti < righti.
// A pair p2 = [c, d] follows a pair p1 = [a, b] 
// if b < c. A chain of pairs can be formed in this fashion.
// Return the length longest chain which can be formed.

func findLongestChain(_ pairs: [[Int]]) -> Int {
    let pairs = pairs.sorted { $0[1] < $1[1] }
    var result = [pairs[0]]

    for i in 1..<pairs.count {
        let last = result[result.count - 1]

        if pairs[i][0] > last[1] { result.append(pairs[i]) }
    }

    return result.count
}

print(findLongestChain([[1,2],[2,3],[3,4]]))
print(findLongestChain([[1,2],[7,8],[4,5]]))