class Solution {
    func reverseBits(_ n: Int) -> Int {
        var n = UInt32(truncatingIfNeeded: n)
        var ret: UInt32 = 0
        var power = 31
        
        while n != 0 {
            ret += (n & 1) << power
            n >>= 1
            power -= 1
        }
        
        return Int(Int32(bitPattern: ret))
    }
}