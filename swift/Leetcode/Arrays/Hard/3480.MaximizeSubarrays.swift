class Solution {
    func maxSubarrays(_ n: Int, _ conflictingPairs: [[Int]]) -> Int {
        var bMin1 = [Int](repeating: Int(Int32.max), count: n + 1)
        var bMin2 = [Int](repeating: Int(Int32.max), count: n + 1)
        
        for pair in conflictingPairs {
            let a = min(pair[0], pair[1])
            let b = max(pair[0], pair[1])
            if bMin1[a] > b {
                bMin2[a] = bMin1[a]
                bMin1[a] = b
            } else if bMin2[a] > b {
                bMin2[a] = b
            }
        }
        
        var res = 0
        var ib1 = n
        var b2 = 0x3FFFFFFF
        var delCount = [Int](repeating: 0, count: n + 1)
        
        for i in (1...n).reversed() {
            if bMin1[ib1] > bMin1[i] {
                b2 = min(b2, bMin1[ib1])
                ib1 = i
            } else {
                b2 = min(b2, bMin1[i])
            }
            res += min(bMin1[ib1], n + 1) - i
            delCount[ib1] += min(min(b2, bMin2[ib1]), n + 1) - min(bMin1[ib1], n + 1)
        }
        
        return res + (delCount.max() ?? 0)
    }
}