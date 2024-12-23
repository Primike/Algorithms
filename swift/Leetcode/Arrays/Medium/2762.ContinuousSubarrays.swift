// You are given a 0-indexed integer array nums. A subarray of nums 
// is called continuous if:
// Let i, i + 1, ..., j be the indices in the subarray. Then, 
// for each pair of indices i <= i1, i2 <= j, 0 <= |nums[i1] - nums[i2]| <= 2.
// Return the total number of continuous subarrays.
// A subarray is a contiguous non-empty sequence of elements within an array.

func continuousSubarrays(_ nums: [Int]) -> Int {
    var freq: [Int: Int] = [:]
    var left = 0
    var right = 0
    var count = 0

    while right < nums.count {
        freq[nums[right], default: 0] += 1

        while let maxKey = freq.keys.max(), let minKey = freq.keys.min(), maxKey - minKey > 2 {
            if let current = freq[nums[left]] {
                freq[nums[left]] = current - 1
                if freq[nums[left]] == 0 {
                    freq[nums[left]] = nil
                }
            }
            left += 1
        }

        count += right - left + 1
        right += 1
    }

    return count
}

print(continuousSubarrays([5,4,2,4]))
print(continuousSubarrays([1,2,3]))