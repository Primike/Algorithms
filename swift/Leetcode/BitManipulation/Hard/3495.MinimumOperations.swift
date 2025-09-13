class Solution {
    func get(_ num: Int) -> Int {
        var i = 1
        var base = 1
        var cnt = 0
        while base <= num {
            cnt += ((i + 1) / 2) * (min(base * 2 - 1, num) - base + 1)
            i += 1
            base *= 2
        }
        return cnt
    }

    func minOperations(_ queries: [[Int]]) -> Int {
        var res = 0
        for q in queries {
            res += (self.get(q[1]) - self.get(q[0] - 1) + 1) / 2
        }
        return res
    }
}