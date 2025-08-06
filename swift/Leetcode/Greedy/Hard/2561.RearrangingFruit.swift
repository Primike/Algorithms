class Solution {
    func minCost(_ basket1: [Int], _ basket2: [Int]) -> Int {
        var freq = [Int: Int]()
        var m = Int.max
        for b1 in basket1 {
            freq[b1, default: 0] += 1
            m = min(m, b1)
        }
        for b2 in basket2 {
            freq[b2, default: 0] -= 1
            m = min(m, b2)
        }
        var merge = [Int]()
        for (k, c) in freq {
            if c % 2 != 0 { return -1 }
            let count = abs(c) / 2
            for _ in 0..<count { merge.append(k) }
        }
        if merge.isEmpty { return 0 }
        merge.sort()
        let half = merge.count / 2
        var total = 0
        for i in 0..<half {
            total += min(2 * m, merge[i])
        }
        return total
    }
}