// Given an integer array nums and an integer k, 
// return true if there are two distinct indices i and j in the array 
// such that nums[i] == nums[j] and abs(i - j) <= k.

// Time: O(n), Space: O(k)
func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var window = Set<Int>()

    for (i, number) in nums.enumerated() {
        if window.contains(number) { return true }

        window.insert(number)
        
        if i >= k { window.remove(nums[i - k]) }
    }

    return false
}

print(containsNearbyDuplicate([1,2,3,1], k = 3))
print(containsNearbyDuplicate([1,0,1,1], k = 1))
print(containsNearbyDuplicate([1,2,3,1,2,3], k = 2))