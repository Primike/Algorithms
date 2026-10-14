class Solution {
    private func gcd(_ a: Int, _ b: Int) -> Int {
        var a = a
        var b = b
        while b != 0 {
            let t = a % b
            a = b
            b = t
        }
        return a
    }

    func gcdSum(_ nums: [Int]) -> Int {
        let n = nums.count
        var mx = [Int]()
        mx.reserveCapacity(n)
        
        var prefixMax = Int.min
        for x in nums {
            prefixMax = max(prefixMax, x)
            mx.append(prefixMax)
        }
        
        var prefixGcd = [Int]()
        prefixGcd.reserveCapacity(n)
        for i in 0..<n {
            prefixGcd.append(gcd(nums[i], mx[i]))
        }
        prefixGcd.sort()
        
        var ans = 0
        var left = 0
        var right = n - 1
        while left < right {
            ans += gcd(prefixGcd[left], prefixGcd[right])
            left += 1
            right -= 1
        }
        
        return ans
    }
}