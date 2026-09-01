class Solution {
    func maxProduct(_ n: Int) -> Int {
        var num = n
        var first = 0
        var second = 0
        
        while num > 0 {
            let x = num % 10
            if x > first {
                second = first
                first = x
            } else if x > second {
                second = x
            }
            num /= 10
        }
        
        return first * second
    }
}