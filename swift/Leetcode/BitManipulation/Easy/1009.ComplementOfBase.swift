class Solution {
    func bitwiseComplement(_ N: Int) -> Int {
        if N == 0 {
            return 1
        }
        
        var bitmask = N
        bitmask |= (bitmask >> 1)
        bitmask |= (bitmask >> 2)
        bitmask |= (bitmask >> 4)
        bitmask |= (bitmask >> 8)
        bitmask |= (bitmask >> 16)
        
        return bitmask ^ N
    }
}