// You are given an integer array nums and an integer x. In one operation, 
// you can either remove the leftmost or the rightmost element 
// from the array nums and subtract its value from x. 
// Note that this modifies the array for future operations.
// Return the minimum number of operations to reduce x 
// to exactly 0 if it is possible, otherwise, return -1.

func minOperations(_ nums: [Int], _ x: Int) -> Int {
    let target = nums.reduce(0, +) - x
    var result = Int.min
    var left = 0, current = 0

    for (i, number) in nums.enumerated() {
        current += number

        while left <= i, current > target {
            current -= nums[left]
            left += 1
        }

        if current == target { result = max(result, i - left + 1) }
    }

    return result == .min ? -1 : nums.count - result
}

print(minOperations([1,1,4,2,3], 5))
print(minOperations([5,6,7,8,9], 4))
print(minOperations([3,2,20,1,1,3], 10))