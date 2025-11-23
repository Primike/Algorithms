// You are given an array of integers nums. 
// You are also given an integer original which is the 
// first number that needs to be searched for in nums.
// You then do the following steps:
// If original is found in nums, multiply it by two 
// (i.e., set original = 2 * original).
// Otherwise, stop the process.
// Repeat this process with the new number as long as you keep finding the number.
// Return the final value of original.

// Time: O(n), Space: O(1)
func findFinalValue(_ nums: [Int], _ original: Int) -> Int {
    var numberSet = Set(nums)
    var result = original

    while numberSet.contains(result) {
        result *= 2
    }

    return result
}

print(findFinalValue([5,3,6,1,12], 3))
print(findFinalValue([2,7,9], 4))