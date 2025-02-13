// nums contains a valid split at index i if the following are true:
// The sum of the first i + 1 elements is greater than or 
// equal to the sum of the last n - i - 1 elements.
// There is at least one element to the right of i. That is, 0 <= i < n - 1.
// Return the number of valid splits in nums.

func waysToSplitArray(_ nums: [Int]) -> Int {
    var result = 0
    var total = nums.reduce(0, +)
    var sum = 0

    for i in 0..<(nums.count - 1) {
        sum += nums[i]
        total -= nums[i]
        
        if sum >= total { result += 1 }
    }

    return result
}

print(waysToSplitArray([10,4,-8,7]))
print(waysToSplitArray([2,3,1,0]))