//You are given an integer array nums and an integer k. 
//In one operation, you can choose an index of nums and 
//increment the element at that index by 1.
//Return the maximum possible frequency of an element after performing at most k operations.

func maxFrequency(_ nums: [Int], _ k: Int) -> Int {
    let nums = nums.sorted()
    var total = 0
    var left = 0
    var result = 1
    
    for right in 1..<nums.count {
        total += (nums[right] - nums[right - 1]) * (right - left)
        while total > k {
            total -= nums[right] - nums[left]
            left += 1
        }
        
        result = max(result, right - left + 1)
    }
    
    return result
}

print(maxFrequency([1,2,4], 5))
print(maxFrequency([1,4,8,13], 5))
print(maxFrequency([3,9,6], 2))