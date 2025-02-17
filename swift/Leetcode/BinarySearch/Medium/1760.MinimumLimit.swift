// You are given an integer array nums where the ith bag contains 
// nums[i] balls. You are also given an integer maxOperations.
// You can perform the following operation at most maxOperations times:
// Take any bag of balls and divide it into two new bags 
// with a positive number of balls.
// For example, a bag of 5 balls can become two new bags of 1 and 4 balls, 
// or two new bags of 2 and 3 balls.
// Your penalty is the maximum number of balls in a bag. 
// You want to minimize your penalty after the operations.
// Return the minimum possible penalty after performing the operations.

// Time: O(n * log(n)), Space: O(1)
func minimumSize(_ nums: [Int], _ maxOperations: Int) -> Int {
    var left = 1, right = nums.max() ?? 0

    while left < right {
        let mid = (right + left) / 2
        var operations = 0

        for number in nums {
            if number > mid { operations += (number - 1) / mid }
        }

        if operations <= maxOperations {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return left
}

print(minimumSize([9], 2))
print(minimumSize([2,4,8,2], 4))