// Given two integer arrays nums1 and nums2, 
// sorted in non-decreasing order, 
// return the minimum integer common to both arrays. 
// If there is no common integer amongst nums1 and nums2, return -1.

// Time: O(n + m), Space: O(1)
func getCommon(_ nums1: [Int], _ nums2: [Int]) -> Int {
    var left = 0, right = 0

    while left < nums1.count, right < nums2.count {
        if nums1[left] < nums2[right] {
            left += 1
        } else if nums1[left] > nums2[right] {
            right += 1
        } else {
            return nums1[left]
        }
    }

    return -1
}

print(getCommon([1,2,3], [2,4]))
print(getCommon([1,2,3,6], [2,3,4,5]))