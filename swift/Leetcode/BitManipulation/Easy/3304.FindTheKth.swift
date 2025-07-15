class Solution {
    func kthCharacter(_ k: Int) -> String {
        var ans = 0
        var mutableK = k
        
        while mutableK != 1 {
            var t = Int.bitWidth - mutableK.leadingZeroBitCount - 1
            if (1 << t) == mutableK {
                t -= 1
            }
            mutableK -= (1 << t)
            ans += 1
        }
        
        let scalarA = UnicodeScalar("a").value
        return String(UnicodeScalar(scalarA + UInt32(ans))!)
    }
}