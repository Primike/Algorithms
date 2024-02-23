// Given an integer array nums and an integer k, 
// return the number of good subarrays of nums.
// A good array is an array where the number of
//  different integers in that array is exactly k.

// Time: O(n), Space: O(n)
func subarraysWithKDistinct(_ nums: [Int], _ k: Int) -> Int {
    func atMostK(_ nums: [Int], _ k: Int) -> Int {
        var window = [Int: Int]()
        var result = 0
        var left = 0

        for (i, number) in nums.enumerated() {
            window[number, default: 0] += 1

            while window.keys.count > k {
                window[nums[left], default: 1] -= 1
                if window[nums[left]] == 0 { window[nums[left]] = nil }
                left += 1
            }

            result += i - left + 1
        }

        return result
    }

    return atMostK(nums, k) - atMostK(nums, k - 1)
}

print(subarraysWithKDistinct([1,2,1,2,3], 2))
print(subarraysWithKDistinct([1,2,1,3,4], 3))