// You are given an integer array matchsticks where matchsticks[i] is the length 
// of the ith matchstick. You want to use all the matchsticks to make one square. 
// You should not break any stick, but you can link them up, 
// and each matchstick must be used exactly one time.
// Return true if you can make this square and false otherwise.

// Time: O(4^n), Space: O(n)
func makesquare(_ matchsticks: [Int]) -> Bool {
    let sum = matchsticks.reduce(0, +)
    if sum % 4 != 0 { return false }
    let matchsticks = matchsticks.sorted { $0 > $1 }
    var target = sum / 4

    func backtrack(_ index: Int, _ sides: [Int]) -> Bool {
        if index == matchsticks.count { return sides.allSatisfy { $0 == target } }

        for (i, side) in sides.enumerated() {
            if side + matchsticks[index] > target { continue }

            var newSides = sides
            newSides[i] += matchsticks[index]

            if backtrack(index + 1, newSides) { return true }
        }

        return false
    }

    return backtrack(0, Array(repeating: 0, count: 4))
}

print(makesquare([1,1,2,2,2]))
print(makesquare([3,3,3,3,4]))