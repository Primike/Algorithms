// Given an integer array nums and an integer k, split nums into k 
// non-empty subarrays such that the largest sum of any subarray is minimized.

// Time: O(n * logn), Space: O(1)
func splitArray(_ nums: [Int], _ k: Int) -> Int {
    var left = nums.max() ?? 0, right = nums.reduce(0, +)

    while left < right {
        let mid = (right + left) / 2
        var current = 0
        var count = 1

        for number in nums {
            if current + number > mid {
                count += 1
                current = 0
            }
            
            current += number
        }
        
        if count <= k {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return left
}

print(splitArray([7,2,5,10,8], 2))
print(splitArray([1,2,3,4,5], 2))