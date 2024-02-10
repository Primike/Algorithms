// Given a non-empty array of integers nums, 
// every element appears twice except for one. Find that single one.
// You must implement a solution with a linear runtime complexity 
// and use only constant extra space.

// Time: O(n), Space: O(1)
func singleNumber(_ nums: [Int]) -> Int {
    var result = 0

    for number in nums {
        result ^= number
    }

    return result
}

print(singleNumber([2,2,1]))
print(singleNumber([4,1,2,1,2]))
print(singleNumber([1]))