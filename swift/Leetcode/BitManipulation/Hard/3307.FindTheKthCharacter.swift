class Solution {
    func kthCharacter(_ k: Int, _ operations: [Int]) -> String {
        var ans = 0
        var currentK = k
        
        while currentK != 1 {
            var t = currentK.bitWidth - currentK.leadingZeroBitCount - 1
            if (1 << t) == currentK {
                t -= 1
            }
            
            currentK -= (1 << t)
            
            if operations[t] != 0 {
                ans += 1
            }
        }
        
        let scalarA = "a".unicodeScalars.first!.value
        let newScalarValue = scalarA + UInt32(ans % 26)
        
        return String(UnicodeScalar(newScalarValue)!)
    }
}