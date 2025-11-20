class Solution {
    
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let temp = b
            b = a % b
            a = temp
        }
        return a
    }
    
    func minOperations(_ nums: [Int]) -> Int {
        let n = nums.count
        var num1 = 0
        var g = 0

        for x in nums {
            if x == 1 {
                num1 += 1
            }
            g = gcd(g, x)
        }

        if num1 > 0 {
            return n - num1
        }
        if g > 1 {
            return -1
        }

        var minLen = n
        for i in 0..<n {
            g = 0
            for j in i..<n {
                g = gcd(g, nums[j])
                if g == 1 {
                    minLen = min(minLen, j - i + 1)
                    break
                }
            }
        }

        return minLen + n - 2
    }
}