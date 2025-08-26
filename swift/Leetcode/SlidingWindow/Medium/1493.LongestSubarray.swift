// Given a binary array nums, you should delete one element from it.
// Return the size of the longest non-empty subarray containing 
// only 1's in the resulting array. Return 0 if there is no such subarray.

// Time: O(n), Space: O(1)
func longestSubarray(_ nums: [Int]) -> Int {
    var result = 0
    var lastSubarray = 0
    var foundZero = false
    var currentSubarray = 0

    for i in 0..<nums.count {
        if nums[i] == 1 {
            currentSubarray += 1 
        } else {
            lastSubarray = currentSubarray
            currentSubarray = 0
            foundZero = !foundZero
        }

        result = max(result, lastSubarray + currentSubarray)
    }

    if result == nums.count { return result - 1 }
    return result
}

print(longestSubarray([1,1,0,1]))
print(longestSubarray([0,1,1,1,0,1,1,0,1]))
print(longestSubarray([1,1,1]))