class Solution {
    func isOneBitCharacter(_ bits: [Int]) -> Bool {
        var i = bits.count - 2
        var ones = 0
        while i >= 0 && bits[i] == 1 {
            ones += 1
            i -= 1
        }
        return ones % 2 == 0
    }
}