class Solution {
    func hasAlternatingBits(_ n: Int) -> Bool {
        var n = n
        var cur = n % 2
        n /= 2
        while n > 0 {
            if cur == n % 2 {
                return false
            }
            cur = n % 2
            n /= 2
        }
        return true
    }
}