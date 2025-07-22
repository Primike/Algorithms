// You are given an array of positive integers nums and 
// want to erase a subarray containing unique elements. 
// The score you get by erasing the subarray is equal to the sum of its elements.
// Return the maximum score you can get by erasing exactly one subarray.

// Time: O(n), Space: O(1)
func maximumUniqueSubarray(_ nums: [Int]) -> Int {
    var numbers = Set<Int>()
    var result = 0
    var sum = 0
    var left = 0

    for i in 0..<nums.count {            
        while numbers.contains(nums[i]) {
            sum -= nums[left] 
            numbers.remove(nums[left])
            left += 1
        }

        numbers.insert(nums[i])
        sum += nums[i]
        result = max(result, sum)
    }

    return result
}

print(maximumUniqueSubarray([4,2,4,5,6]))
print(maximumUniqueSubarray([5,2,1,2,5,2,1,2,5]))