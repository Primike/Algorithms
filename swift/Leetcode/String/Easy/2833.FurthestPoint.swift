class Solution {
    func furthestDistanceFromOrigin(_ moves: String) -> Int {
        var balance = 0
        var underscores = 0
        
        for move in moves {
            if move == "L" {
                balance -= 1
            } else if move == "R" {
                balance += 1
            } else {
                underscores += 1
            }
        }
        
        return abs(balance) + underscores
    }
}