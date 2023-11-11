// You are given an integer array matchsticks where matchsticks[i] is the length 
// of the ith matchstick. You want to use all the matchsticks to make one square. 
// You should not break any stick, but you can link them up, 
// and each matchstick must be used exactly one time.
// Return true if you can make this square and false otherwise.

func makesquare(_ matchsticks: [Int]) -> Bool {
    let total = matchsticks.reduce(0, +)

    if total % 4 != 0 { return false }

    let matchsticks = matchsticks.sorted { $0 > $1 }
    let length = total / 4
    
    func backtrack(_ index: Int, _ sides: [Int]) -> Bool {
        if index == matchsticks.count {
            return sides[0] == length && sides[1] == length && sides[2] == length && sides[3] == length
        }
        
        for i in 0..<4 {
            if sides[i] + matchsticks[index] <= length {
                var newSides = sides
                newSides[i] += matchsticks[index]
                
                if backtrack(index + 1, newSides) { return true }
            }
        }
        
        return false
    }
    
    return backtrack(0, [0, 0, 0, 0])
}

print(makesquare([1,1,2,2,2]))
print(makesquare([3,3,3,3,4]))