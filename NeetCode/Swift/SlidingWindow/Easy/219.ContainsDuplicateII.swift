//Given an integer array nums and an integer k, 
//return true if there are two distinct indices i and j in the array 
//such that nums[i] == nums[j] and abs(i - j) <= k.

func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
    var hashSet = Set<Int>()
    var left = 0, right = 0

    while right < nums.count {
        if hashSet.contains(nums[right]) {
            return true
        }

        hashSet.insert(nums[right])
        right += 1

        if right - left > k {
            hashSet.remove(nums[left])
            left += 1
        }
    }

    return false
}

func containsNearbyDuplicate2(_ nums: [Int], _ k: Int) -> Bool {
    var window: Set<Int> = []
    var left = 0

    for (i, number) in nums.enumerated() {
        if i - left > k {
            window.remove(nums[left])
            left += 1
        }
        if window.contains(number) {
            return true
        }
        
        window.insert(number)
    }

    return false
}

print(containsNearbyDuplicate([1,2,3,1], k = 3))
print(containsNearbyDuplicate([1,0,1,1], k = 1))
print(containsNearbyDuplicate([1,2,3,1,2,3], k = 2))