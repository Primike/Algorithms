// Given an integer array nums and an integer k, split nums into k 
// non-empty subarrays such that the largest sum of any subarray is minimized.

func splitArray(_ nums: [Int], _ k: Int) -> Int {
    var left = nums.max() ?? 0, right = nums.reduce(0, +)
    var result = right

    while left <= right {
        let mid = (right + left) / 2
        var currentCount = 0
        var subarrays = 0

        for number in nums {
            if number > mid {
                subarrays = k + 1 
                break
            }

            if currentCount + number > mid {
                subarrays += 1
                currentCount = number
            } else {
                currentCount += number
            }
        }

        if currentCount > 0 { subarrays += 1 }

        if subarrays <= k {
            result = mid
            right = mid - 1
        } else {
            left = mid + 1
        }
    }

    return result
}

print(splitArray([7,2,5,10,8], 2))
print(splitArray([1,2,3,4,5], 2))