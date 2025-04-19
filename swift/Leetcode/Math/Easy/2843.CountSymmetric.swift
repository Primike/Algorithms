class Solution {
    func countSymmetricIntegers(_ low: Int, _ high: Int) -> Int {
        var res = 0
        for a in low...high {
            if a >= 10 && a < 100 { 
                if a % 11 == 0 {
                     res += 1
                }
            } else if a >= 1000 && a < 10000 {
                let left = a / 1000 + (a % 1000) / 100
                let right = (a % 100) / 10 + a % 10
                if left == right {
                    res += 1
                }
            }

        }
        return res
    }
}