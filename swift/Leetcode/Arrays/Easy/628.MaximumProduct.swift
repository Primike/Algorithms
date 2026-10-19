class Solution {
    func maximumProduct(_ nums: [Int]) -> Int {
        var min1 = Int.max
        var min2 = Int.max
        var max1 = Int.min
        var max2 = Int.min
        var max3 = Int.min
        
        for n in nums {
            if n <= min1 {
                min2 = min1
                min1 = n
            } else if n <= min2 {
                min2 = n
            }
            
            if n >= max1 {
                max3 = max2
                max2 = max1
                max1 = n
            } else if n >= max2 {
                max3 = max2
                max2 = n
            } else if n >= max3 {
                max3 = n
            }
        }
        
        return max(min1 * min2 * max1, max1 * max2 * max3)
    }
}