// Given a list of dominoes, dominoes[i] = [a, b] 
// is equivalent to dominoes[j] = [c, d] if and only 
// if either (a == c and b == d), or (a == d and b == c) - that is, 
// one domino can be rotated to be equal to another domino.
// Return the number of pairs (i, j) 
// for which 0 <= i < j < dominoes.length, 
// and dominoes[i] is equivalent to dominoes[j].

// Time: O(n), Space: O(n)
func numEquivDominoPairs(_ dominoes: [[Int]]) -> Int {
    var dict = [[Int]: Int]()

    for domino in dominoes {
        if dict.keys.contains(domino.reversed()) {
            dict[domino.reversed(), default: 0] += 1
        } else {
            dict[domino, default: 0] += 1
        }
    }

    return dict.values.reduce(0) { $0 + ($1 * ($1 - 1) / 2) }
}

print(numEquivDominoPairs([[1,2],[2,1],[3,4],[5,6]]))
print(numEquivDominoPairs([[1,2],[1,2],[1,1],[1,2],[2,2]]))