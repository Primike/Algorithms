class Solution {
    private let mod = 1_000_000_007

    func xorAfterQueries(_ nums: [Int], _ queries: [[Int]]) -> Int {
        var currentNums = nums
        
        for query in queries {
            let l = query[0]
            let r = query[1]
            let k = query[2]
            let v = query[3]
            
            for i in stride(from: l, through: r, by: k) {
                currentNums[i] = (currentNums[i] * v) % mod
            }
        }
        
        return currentNums.reduce(0, ^)
    }
}