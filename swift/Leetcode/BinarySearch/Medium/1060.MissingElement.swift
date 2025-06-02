// Given an integer array nums which is sorted in ascending order 
// and all of its elements are unique and given also an integer k, 
// return the kth missing number starting from the 
// leftmost number of the array.

// Time: O(log(n)), Space: O(1)
func missingElement(_ nums: [Int], _ k: Int) -> Int {
    var left = 0, right = nums.count - 1

    while left < right {
        let mid = (right + left) / 2
        let missing = nums[mid] - mid - nums[0]

        if missing >= k {
            right = mid
        } else {
            left = mid + 1
        }
    }

    let missing = nums[left] - left - nums[0]

    if missing >= k {
        let gapMissing = nums[left] - nums[left - 1] - 1
        return nums[left - 1] + k - (missing - gapMissing)
    } else {
        return nums[left] + k - missing
    }
}

print(missingElement([4,7,9,10], 1))
print(missingElement([4,7,9,10], 3))
print(missingElement([1,2,4], 3))

func missingElement2(_ nums: [Int], _ k: Int) -> Int {
    var missing = 0

    for i in 1..<nums.count {
        let newMissing = nums[i] - nums[i - 1] - 1
        missing += newMissing

        if missing >= k { 
            return nums[i - 1] + k - (missing - newMissing)
        }
    }

    return nums[nums.count - 1] + k - missing
}