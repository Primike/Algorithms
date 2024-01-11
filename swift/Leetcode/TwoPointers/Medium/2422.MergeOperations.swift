// You are given an array nums consisting of positive integers.
// You can perform the following operation on the array any number of times:
// Choose any two adjacent elements and replace them with their sum.
// For example, if nums = [1,2,3,1], you can apply one operation to make it [1,5,1].
// Return the minimum number of operations needed to turn the array into a palindrome.

func minimumOperations(_ nums: [Int]) -> Int {
    var nums = nums
    var left = 0, right = nums.count - 1
    var result = 0

    while left <= right {
        if nums[left] == nums[right] {
            left += 1
            right -= 1
        } else if nums[left] < nums[right] {
            nums[left + 1] += nums[left]
            left += 1
            result += 1
        } else {
            nums[right - 1] += nums[right]
            right -= 1
            result += 1
        }
    }

    return result
}

print(minimumOperations([4,3,2,1,2,3,1]))
print(minimumOperations([1,2,3,4]))