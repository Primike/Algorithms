// Given two integer arrays nums1 and nums2, return an array 
// of their intersection. Each element in the result must be 
// unique and you may return the result in any order.

func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    return Array(Set(nums1).intersection(Set(nums2)))
}

print(intersection([1,2,2,1], [2,2]))
print(intersection([4,9,5], [9,4,9,8,4]))