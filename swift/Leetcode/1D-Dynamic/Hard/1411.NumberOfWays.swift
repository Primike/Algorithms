class Solution {
    func numOfWays(_ n: Int) -> Int {
        let MOD = 1000000007
        var x = 6
        var y = 6
        
        for _ in 1..<n {
            let newX = (3 * x + 2 * y) % MOD
            let newY = (2 * x + 2 * y) % MOD
            x = newX
            y = newY
        }
        
        return (x + y) % MOD
    }
}