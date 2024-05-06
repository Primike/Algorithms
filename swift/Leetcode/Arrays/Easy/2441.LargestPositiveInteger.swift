// Given an integer array nums that does not contain any zeros, 
// find the largest positive integer k such that -k also exists in the array.
// Return the positive integer k. If there is no such integer, return -1.

// Time: O(n), Space: O(n)
func findMaxK(_ nums: [Int]) -> Int {
    var dict = [Int: Int]()
    var result = -1

    for i in 0..<nums.count {
        let number = abs(nums[i])

        if let value = dict[number], value == nums[i] * -1 {
            result = max(result, number)
        }

        dict[number] = nums[i]
    }

    return result
}

print(findMaxK([-1,2,-3,3]))
print(findMaxK([-1,10,6,7,-7,1]))
print(findMaxK([-10,8,6,7,-2,-3]))