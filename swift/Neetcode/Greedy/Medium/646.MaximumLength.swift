// You are given an array of n pairs pairs 
// where pairs[i] = [lefti, righti] and lefti < righti.
// A pair p2 = [c, d] follows a pair p1 = [a, b] 
// if b < c. A chain of pairs can be formed in this fashion.
// Return the length longest chain which can be formed.

// Time: O(n * logn), Space: O(1)
func findLongestChain(_ pairs: [[Int]]) -> Int {
    let pairs = pairs.sorted { $0[1] < $1[1] }
    var result = 1
    var current = pairs[0][1]

    for i in 1..<pairs.count {
        if pairs[i][0] > current {
            current = pairs[i][1]
            result += 1
        }
    }

    return result
}

print(findLongestChain([[1,2],[2,3],[3,4]]))
print(findLongestChain([[1,2],[7,8],[4,5]]))