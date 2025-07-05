// You are given a 0-indexed integer array nums, an integer modulo, and an integer k.
// Your task is to find the count of subarrays that are interesting.
// A subarray nums[l..r] is interesting if the following condition holds:
// Let cnt be the number of indices i in the range [l, r] 
// such that nums[i] % modulo == k. Then, cnt % modulo == k.
// Return an integer denoting the count of interesting subarrays.

// Time: O(n), Space: O(n)
func countInterestingSubarrays(_ nums: [Int], _ modulo: Int, _ k: Int) -> Int {
    var prefixDict = [0: 1]
    var result = 0
    var count = 0

    for i in 0..<nums.count {
        count += nums[i] % modulo == k ? 1 : 0
        let remainder = count % modulo
        let key = (remainder - k + modulo) % modulo

        if let value = prefixDict[key] { result += value }

        prefixDict[remainder, default: 0] += 1
    }

    return result
}

print(countInterestingSubarrays([3,2,4], 2, 1))
print(countInterestingSubarrays([3,1,9,6], 3, 0))