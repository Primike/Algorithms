// You are given a 0-indexed integer array nums. In one operation you can 
// replace any element of the array with any two elements that sum to it.
// For example, consider nums = [5,6,7]. In one operation, we can replace 
// nums[1] with 2 and 4 and convert nums to [5,2,4,7].
// Return the minimum number of operations to make an array that is 
// sorted in non-decreasing order.

func minimumReplacement(_ nums: [Int]) -> Int {
    var result = 0
    var previous = nums[nums.count - 1]

    for i in stride(from: nums.count - 2, to: -1, by: -1) {
        if nums[i] > previous {
            let pieces = (nums[i] + previous - 1) / previous 
            result += pieces - 1 
            previous = nums[i] / pieces 
        } else {
            previous = nums[i]
        }
    }

    return result
}

print(minimumReplacement([3,9,3]))
print(minimumReplacement([1,2,3,4,5]))