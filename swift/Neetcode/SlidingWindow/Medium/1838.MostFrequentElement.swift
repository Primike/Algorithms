// You are given an integer array nums and an integer k. 
// In one operation, you can choose an index of nums and 
// increment the element at that index by 1.
// Return the maximum possible frequency of an element after performing at most k operations.

func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
    let nums = nums.sorted()
    var left = 0, current = 0
    var result = 0

    for i in 0..<nums.count {
        current += nums[i]

        if (nums[i] * (i - left + 1) - current) > k {
            current -= nums[left]
            left += 1
        }

        result = max(result, i - left + 1)
    }
    
    return result
}

print(maxFrequency([1,2,4], 5))
print(maxFrequency([1,4,8,13], 5))
print(maxFrequency([3,9,6], 2))