// Consider a non-empty subarray from nums that has 
// the maximum possible bitwise AND.
// In other words, let k be the maximum value of the bitwise 
// AND of any subarray of nums. Then, only subarrays with a bitwise 
// AND equal to k should be considered.
// Return the length of the longest such subarray.

func longestSubarray(_ nums: [Int]) -> Int {
    var result = 0
    var maximum = 0
    var streak = 0
    
    for number in nums {
        if maximum < number {
            maximum = number
            result = 0
            streak = 0
        }
        
        if maximum == number {
            streak += 1
        } else {
            streak = 0
        }
        
        result = max(result, streak)
    }
    
    return result
}

print(longestSubarray([1,2,3,3,2,2]))
print(longestSubarray([1,2,3,4]))