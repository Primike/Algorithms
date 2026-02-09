// You are given an integer array nums that represents a circular array. 
// Your task is to create a new array result of the same size, 
// following these rules:
// For each index i (where 0 <= i < nums.length), 
// perform the following independent actions:
// If nums[i] > 0: Start at index i and move nums[i] steps 
// to the right in the circular array. Set result[i] 
// to the value of the index where you land.
// If nums[i] < 0: Start at index i and move abs(nums[i]) steps 
// to the left in the circular array. Set result[i] 
// to the value of the index where you land.
// If nums[i] == 0: Set result[i] to nums[i].
// Return the new array result.

// Time: O(n), Space: O(n)
func constructTransformedArray(_ nums: [Int]) -> [Int] {
    let n = nums.count
    var result = nums

    for (i, number) in nums.enumerated() {
        if number > 0 {
            let index = (i + number) % n
            result[i] = nums[index]
        } else if number < 0 {
            let index = (i - (abs(number) % n) + n) % n
            result[i] = nums[index]
        }
    }

    return result
}

print(constructTransformedArray([3,-2,1,1]))
print(constructTransformedArray([-1,4,-1]))