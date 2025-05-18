// You are given two arrays nums1 and nums2 consisting of positive integers.
// You have to replace all the 0's in both arrays 
// with strictly positive integers such that the sum of 
// elements of both arrays becomes equal.
// Return the minimum equal sum you can obtain, or -1 if it is impossible.

// Time: O(n), Space: O(1)
func minSum(_ nums1: [Int], _ nums2: [Int]) -> Int {
    let zeros1 = nums1.filter { $0 == 0 }.count
    let zeros2 = nums2.filter { $0 == 0 }.count
    let sum1 = nums1.reduce(0, +) + zeros1
    let sum2 = nums2.reduce(0, +) + zeros2

    if sum1 == sum2 { return sum1 }
    if sum1 < sum2, zeros1 != 0 { return sum2 }
    if sum1 > sum2, zeros2 != 0 { return sum1 }

    return -1
}

print(minSum([3,2,0,1,0], [6,5,0]))
print(minSum([2,0,2,0], [1,4]))