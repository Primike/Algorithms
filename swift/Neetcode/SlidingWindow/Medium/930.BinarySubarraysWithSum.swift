// Given a binary array nums and an integer goal, 
// return the number of non-empty subarrays with a sum goal.
// A subarray is a contiguous part of the array.

// Time: O(n), Space: O(n)
func numSubarraysWithSum(_ nums: [Int], _ goal: Int) -> Int {
    var dict = [0: 1]
    var result = 0
    var sum = 0

    for number in nums {
        sum += number

        if let count = dict[sum - goal] { result += count }

        dict[sum, default: 0] += 1
    }

    return result
}

print(numSubarraysWithSum([1,0,1,0,1], 2))
print(numSubarraysWithSum([0,0,0,0,0], 0))