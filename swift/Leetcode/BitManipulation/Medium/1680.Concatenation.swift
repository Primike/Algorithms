class Solution {
    func concatenatedBinary(_ n: Int) -> Int {
        let MOD = 1_000_000_007
        var length = 0
        var result = 0
        
        for i in 1...n {
            if i & (i - 1) == 0 {
                length += 1
            }
            result = ((result << length) | i) % MOD
        }
        
        return result
    }
}