// Given two arrays nums1 and nums2 of length n, 
// return the minimum product sum if you are allowed to 
// rearrange the order of the elements in nums1. 

// Time: O(n * log(n)), Space: O(n)
func minProductSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
    let nums1 = nums1.sorted(), nums2 = nums2.sorted()
    var result = 0

    for i in 0..<nums1.count {
        result += nums1[i] * nums2[nums2.count - 1 - i]
    }

    return result
}

print(minProductSum([5,3,4,2], [4,2,2,5]))
print(minProductSum([2,1,4,5,7], [3,2,4,8,6]))