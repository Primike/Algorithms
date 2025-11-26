class Solution {
    func minOperations(_ nums: [Int]) -> Int {
        var s = [Int]()
        var res = 0
        for a in nums {
            while !s.isEmpty && s.last! > a {
                s.removeLast()
            }
            if a == 0 {
                continue
            }
            if s.isEmpty || s.last! < a {
                res += 1
                s.append(a)
            }
        }
        return res
    }
}