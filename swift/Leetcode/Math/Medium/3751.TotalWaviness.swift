class Solution {
    func totalWaviness(_ num1: Int, _ num2: Int) -> Int {
        var cnt = 0
        
        for i in num1...num2 {
            var n = i
            var t = [Int]()
            
            while n > 0 {
                t.append(n % 10)
                n /= 10
            }
            
            if t.count < 3 { continue }
            
            for j in 1..<(t.count - 1) {
                if t[j] > t[j - 1] && t[j] > t[j + 1] {
                    cnt += 1
                } else if t[j] < t[j - 1] && t[j] < t[j + 1] {
                    cnt += 1
                }
            }
        }
        
        return cnt
    }
}