// In one operation, you can do the following:
// Choose an index i that hasn't been chosen before from the range [0, nums.length - 1].
// Replace nums[i] with any integer from the range [nums[i] - k, nums[i] + k].
// The beauty of the array is the length of the longest subsequence 
// consisting of equal elements.
// Return the maximum possible beauty of the array nums after 
// applying the operation any number of times.

func maximumBeauty(_ nums: [Int], _ k: Int) -> Int {
    var nums = nums.sorted()
    var left = 0
    var result = 0

    for i in 0..<nums.count {
        while nums[i] - nums[left] > 2 * k {
            left += 1
        }

        result = max(result, i - left + 1)
    }

    return result
}