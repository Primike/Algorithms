class Solution {
    private var digit: [Int] = Array(repeating: 0, count: 100)

    func kMirror(_ k: Int, _ n: Int) -> Int {
        func isPalindrome(_ num: Int) -> Bool {
            var x = num
            var length = -1
            while x != 0 {
                length += 1
                digit[length] = x % k
                x /= k
            }
            
            var i = 0
            var j = length
            while i < j {
                if digit[i] != digit[j] {
                    return false
                }
                i += 1
                j -= 1
            }
            return true
        }

        var left = 1
        var count = 0
        var ans = 0

        while count < n {
            let right = left * 10
            
            for op in 0..<2 {
                for i in left..<right {
                    if count >= n {
                        break
                    }
                    
                    var combined = i
                    var x = (op == 0 ? i / 10 : i)
                    
                    while x != 0 {
                        combined = combined * 10 + x % 10
                        x /= 10
                    }
                    
                    if isPalindrome(combined) {
                        count += 1
                        ans += combined
                    }
                }
            }
            left = right
        }
        return ans
    }
}