class Solution {
    func smallestNumber(_ n: Int, _ t: Int) -> Int {
        func check(_ num: Int) -> Bool {
            var temp = num
            var product = 1
            while temp > 0 {
                product *= temp % 10
                temp /= 10
                if product == 0 {
                    break
                }
            }
            return product % t == 0
        }
        
        var ans = n
        while !check(ans) {
            ans += 1
        }
        return ans
    }
}