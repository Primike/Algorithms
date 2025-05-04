// You are given an array nums consisting of positive integers.
// We call a subarray of an array complete 
// if the following condition is satisfied:
// The number of distinct elements in the subarray is 
// equal to the number of distinct elements in the whole array.
// Return the number of complete subarrays.

// Time: O(n), Space: O(n)
func countCompleteSubarrays(_ nums: [Int]) -> Int {
    let distinctCount = Set(nums).count
    var window = [Int: Int]()
    var result = 0
    var left = 0

    for i in 0..<nums.count {
        window[nums[i], default: 0] += 1

        while left <= i, window.keys.count == distinctCount {
            result += nums.count - i
            window[nums[left]]! -= 1

            if window[nums[left]]! == 0 { window[nums[left]] = nil }
            
            left += 1
        }
    }

    return result
}

print(countCompleteSubarrays([1,3,1,2,2]))
print(countCompleteSubarrays([5,5,5,5]))