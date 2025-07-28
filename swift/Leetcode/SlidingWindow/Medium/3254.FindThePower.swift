// The power of an array is defined as:
// Its maximum element if all of its elements are consecutive 
// and sorted in ascending order. -1 otherwise.
// You need to find the power of all subarrays of nums of size k.
// Return an integer array results of size n - k + 1, 
// where results[i] is the power of nums[i..(i + k - 1)].

// Time: O(n), Space: O(1)
func resultsArray(_ nums: [Int], _ k: Int) -> [Int] {
    if nums.count == 1 { return [nums[0]] }
    if k == 1 { return nums }

    var result = Array(repeating: -1, count: nums.count - k + 1)
    var streak = 1

    for i in 1..<nums.count {
        if nums[i] == nums[i - 1] + 1 { 
            streak = min(k, streak + 1)
        } else {
            streak = 1
        }

        if streak == k { result[i - k + 1] = nums[i] }
    }

    return result
}

print(resultsArray([1,2,3,4,3,2,5], 3))
print(resultsArray([2,2,2,2,2], 4))
print(resultsArray([3,2,3,2,3,2], 2))