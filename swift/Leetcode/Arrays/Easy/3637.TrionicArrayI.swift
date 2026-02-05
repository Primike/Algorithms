// An array is trionic if there exist indices 
// 0 < p < q < n − 1 such that:
// nums[0...p] is strictly increasing,
// nums[p...q] is strictly decreasing,
// nums[q...n − 1] is strictly increasing.
// Return true if nums is trionic, otherwise return false.

// Time: O(n), Space: O(1)
func isTrionic(_ nums: [Int]) -> Bool {
    if nums[0] >= nums[1] { return false }

    var isIncreasing = true
    var result = 0

    for i in 1..<nums.count {
        if nums[i - 1] == nums[i] { return false }

        if isIncreasing {
            if nums[i - 1] > nums[i] {
                isIncreasing = false
                result += 1
            }
        } else {
            if nums[i - 1] < nums[i] {
                isIncreasing = true
                result += 1
            }
        }
    }

    return result == 2
}

print(isTrionic([1,3,5,4,2,6]))
print(isTrionic([2,1,3]))