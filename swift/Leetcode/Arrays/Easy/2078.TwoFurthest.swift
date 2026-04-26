class Solution {
    func maxDistance(_ colors: [Int]) -> Int {
        let n = colors.count
        var res = 0
        
        for i in 0..<n {
            for j in (i + 1)..<n {
                if colors[i] != colors[j] {
                    res = max(res, j - i)
                }
            }
        }
        
        return res
    }
}