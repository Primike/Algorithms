// Given two 0-indexed integer arrays nums1 and nums2, 
// return a list answer of size 2 where:
// answer[0] is a list of all distinct integers 
// in nums1 which are not present in nums2.
// answer[1] is a list of all distinct integers 
// in nums2 which are not present in nums1.

func findDifference(_ nums1: [Int], _ nums2: [Int]) -> [[Int]] {
    var nums1Set = Set(nums1), nums2Set = Set(nums2)
    var result: [[Int]] = [[], []]

    for number in nums1Set {
        if !nums2Set.contains(number) {
            result[0].append(number)
        }
    }

    for number in nums2Set {
        if !nums1Set.contains(number) {
            result[1].append(number)
        }
    }

    return result
}

print(findDifference([1,2,3], [2,4,6]))
print(findDifference([1,2,3,3], [1,1,2,2]))