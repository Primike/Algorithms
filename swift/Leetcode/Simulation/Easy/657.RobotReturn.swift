class Solution {
    func judgeCircle(_ moves: String) -> Bool {
        var x = 0
        var y = 0
        
        for move in moves {
            switch move {
            case "U":
                y -= 1
            case "D":
                y += 1
            case "L":
                x -= 1
            case "R":
                x += 1
            default:
                break
            }
        }
        
        return x == 0 && y == 0
    }
}