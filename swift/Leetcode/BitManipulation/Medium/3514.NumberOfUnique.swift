class Solution {
    func uniqueXorTriplets(_ nums: [Int]) -> Int {
        guard let m = nums.max() else { return 0 }
        
        var u = 1
        while u <= m {
            u <<= 1
        }
        
        var one = Array(repeating: false, count: u)
        var two = Array(repeating: false, count: u)
        var three = Array(repeating: false, count: u)
        
        for v in nums {
            one[v] = true
            for x in 0..<u {
                if one[x] {
                    two[x ^ v] = true
                }
            }
        }
        
        for v in nums {
            for x in 0..<u {
                if two[x] {
                    three[x ^ v] = true
                }
            }
        }
        
        var count = 0
        for b in three {
            if b {
                count += 1
            }
        }
        
        return count
    }
}