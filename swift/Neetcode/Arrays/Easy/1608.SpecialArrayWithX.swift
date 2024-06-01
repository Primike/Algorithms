// You are given an array nums of non-negative integers. 
// nums is considered special if there exists a number x 
// such that there are exactly x numbers in nums that are 
// greater than or equal to x.
// Notice that x does not have to be an element in nums.
// Return x if the array is special, otherwise, return -1. 
// It can be proven that if nums is special, the value for x is unique.

// Time: O(n * logn), Space: O(1)
func specialArray(_ nums: [Int]) -> Int {
    var left = 0, right = nums.count

    while left <= right {
        let mid = (right + left) / 2
        var count = nums.filter { $0 >= mid }.count

        if mid > count {
            right = mid - 1
        } else if mid < count {
            left = mid + 1
        } else { 
            return mid 
        }
    }

    return -1 
}

print(specialArray([3,5]))
print(specialArray([0,0]))
print(specialArray([0,4,3,0,4]))