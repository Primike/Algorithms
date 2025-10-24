class Solution {
    func cheapestJump(_ A: [Int], _ B: Int) -> [Int] {
        guard !A.isEmpty else {
            return []
        }
        
        var next = [Int](repeating: -1, count: A.count)
        var dp = [Int64](repeating: 0, count: A.count)
        var res = [Int]()

        for i in stride(from: A.count - 2, through: 0, by: -1) {
            var min_cost: Int64 = Int64(Int32.max)
            for j in (i + 1)...(i + B) {
                if j >= A.count {
                    break
                }
                
                if A[j] >= 0 {
                    let cost = Int64(A[i]) + dp[j]
                    if cost < min_cost {
                        min_cost = cost
                        next[i] = j
                    }
                }
            }
            dp[i] = min_cost
        }

        var i = 0
        while i < A.count && next[i] > 0 {
            res.append(i + 1)
            i = next[i]
        }

        if i == A.count - 1 && A[i] >= 0 {
            res.append(A.count)
        } else {
            return []
        }
        
        return res
    }
}