# Given an integer array nums and an integer k, 
# return true if there are two distinct indices i and j in the array 
# such that nums[i] == nums[j] and abs(i - j) <= k.

def containsNearbyDuplicate(nums, k):
    window = set()
    left = 0

    for i, number in enumerate(nums):
        if i - left > k:
            window.remove(nums[left])
            left += 1
        if number in window:
            return True

        window.add(number)

    return False

print(containsNearbyDuplicate([1,2,3,1], k = 3))
print(containsNearbyDuplicate([1,0,1,1], k = 1))
print(containsNearbyDuplicate([1,2,3,1,2,3], k = 2))