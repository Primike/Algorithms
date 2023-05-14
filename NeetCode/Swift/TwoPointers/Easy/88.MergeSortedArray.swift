//You are given two integer arrays nums1 and nums2, 
//sorted in non-decreasing order, and two integers m and n, 
//representing the number of elements in nums1 and nums2 respectively.
//Merge nums1 and nums2 into a single array sorted in non-decreasing order.

func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
    var last = m + n - 1
    var m = m - 1
    var n = n - 1

    while last >= 0 {
        if m >= 0 && (n < 0 || nums1[m] > nums2[n]) {
            nums1[last] = nums1[m]
            m -= 1
        } else {
            nums1[last] = nums2[n]
            n -= 1
        }

        last -= 1
    }
}

print(merge([1,2,3,0,0,0], 3, [2,5,6], 3))
print(merge([1], 1, [], 0))
print(merge([0], 0, [1], 1))