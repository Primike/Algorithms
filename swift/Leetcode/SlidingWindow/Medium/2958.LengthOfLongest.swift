// You are given an integer array nums and an integer k.
// The frequency of an element x is the number of times it occurs in an array.
// An array is called good if the frequency of each element in this 
// array is less than or equal to k.
// Return the length of the longest good subarray of nums.

// Time: O(n), Space: O(n)
func maxSubarrayLength(_ nums: [Int], _ k: Int) -> Int {
    var numsCount = [Int: Int]()
    var result = 0
    var left = 0

    for (i, number) in nums.enumerated() {
        numsCount[number, default: 0] += 1

        while numsCount[number]! > k, left < i {
            numsCount[nums[left], default: 0] -= 1
            left += 1
        }

        result = max(result, i - left + 1)
    }

    return result
}

print(maxSubarrayLength([1,2,3,1,2,3,1,2], 2))
print(maxSubarrayLength([1,2,1,2,1,2,1,2], 1))
print(maxSubarrayLength([5,5,5,5,5,5,5], 4))