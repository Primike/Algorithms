class Solution {
    func stoneGameIX(_ stones: [Int]) -> Bool {
        var cnt0 = 0
        var cnt1 = 0
        var cnt2 = 0
        
        for val in stones {
            let typ = val % 3
            if typ == 0 {
                cnt0 += 1
            } else if typ == 1 {
                cnt1 += 1
            } else {
                cnt2 += 1
            }
        }
        
        if cnt0 % 2 == 0 {
            return cnt1 >= 1 && cnt2 >= 1
        }
        
        return cnt1 - cnt2 > 2 || cnt2 - cnt1 > 2
    }
}