// The product difference between two pairs (a, b) and (c, d) 
// is defined as (a * b) - (c * d).
// For example, the product difference between (5, 6) and (2, 7) 
// is (5 * 6) - (2 * 7) = 16.
// Given an integer array nums, choose four distinct indices 
// w, x, y, and z such that the product difference between pairs 
// (nums[w], nums[x]) and (nums[y], nums[z]) is maximized.

// Time: O(n), Space: O(1)
func maxProductDifference(_ nums: [Int]) -> Int {
    var small1 = Int.max, small2 = Int.max
    var big1 = Int.min, big2 = Int.min

    for number in nums {
        if number > big1 {
            big2 = big1
            big1 = number
        } else {
            big2 = max(big2, number)
        }

        if number < small1 {
            small2 = small1
            small1 = number
        } else {
            small2 = min(small2, number)
        }
    }

    return (big1 * big2) - (small1 * small2)
}

print(maxProductDifference([5,6,2,7,4]))
print(maxProductDifference([4,2,5,9,7,4,8]))