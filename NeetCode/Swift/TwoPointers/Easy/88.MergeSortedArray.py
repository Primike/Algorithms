# You are given two integer arrays nums1 and nums2, 
# sorted in non-decreasing order, and two integers m and n, 
# representing the number of elements in nums1 and nums2 respectively.
# Merge nums1 and nums2 into a single array sorted in non-decreasing order.



def merge(nums1, m, nums2, n):

    index = len(nums1) - 1

    while m > 0 and n > 0:
        if nums1[m - 1] > nums2[n - 1]:
            nums1[index] = nums1[m - 1]
            m -= 1
        else:
            nums1[index] = nums2[n - 1]
            n -= 1
        
        index -= 1

    while n > 0:
        nums1[index] = nums2[n - 1]
        n, index = n - 1, index - 1

    return nums1

print(merge([1,2,3,0,0,0], 3, [2,5,6], 3))
print(merge([1], 1, [], 0))
print(merge([0], 0, [1], 1))