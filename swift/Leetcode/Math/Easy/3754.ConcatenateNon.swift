class Solution {
    func sumAndMultiply(_ n: Int) -> Int {
        var num = n
        var x = 0
        var sum = 0
        var pow10 = 1
        
        while num > 0 {
            let d = num % 10
            sum += d
            if d > 0 {
                x += d * pow10
                pow10 *= 10
            }
            num /= 10
        }
        
        return x * sum
    }
}