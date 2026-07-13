class Solution {
    func pathExistenceQueries(_ n: Int, _ nums: [Int], _ maxDiff: Int, _ queries: [[Int]]) -> [Bool] {
        let numCount = nums.count
        var result = Array(repeating: false, count: queries.count)
        var prefix = Array(repeating: 0, count: numCount)
        
        for i in 1..<numCount {
            let flag = (nums[i] - nums[i - 1] > maxDiff) ? 1 : 0
            prefix[i] = prefix[i - 1] + flag
        }
        
        for (i, query) in queries.enumerated() {
            let u = query[0]
            let v = query[1]
            if prefix[u] == prefix[v] {
                result[i] = true
            }
        }
        
        return result
    }
}