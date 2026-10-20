class Solution {
    func maxNumberOfFamilies(_ n: Int, _ reservedSeats: [[Int]]) -> Int {
        let left = 0b11110000
        let middle = 0b11000011
        let right = 0b00001111
        let full = 0b11111111
        
        var occupied = [Int: Int]()
        for seat in reservedSeats {
            let col = seat[1]
            if col >= 2 && col <= 9 {
                let row = seat[0]
                occupied[row, default: 0] |= 1 << (col - 2)
            }
        }
        
        var ans = (n - occupied.count) * 2
        for (_, bitmask) in occupied {
            if (bitmask | left) == left && (bitmask | right) == right {
                ans += 2
            } else if (bitmask | left) == left || (bitmask | middle) == middle || (bitmask | right) == right {
                ans += 1
            }
        }
        
        return ans
    }
}