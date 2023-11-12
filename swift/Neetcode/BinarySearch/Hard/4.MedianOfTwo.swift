// Given two sorted arrays nums1 and nums2 of size m and n respectively, 
// return the median of the two sorted arrays.
// The overall run time complexity should be O(log (m+n)).

func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
    var shorter = nums1, longer = nums2
    let length = nums1.count + nums2.count
    let mid = (length + 1) / 2

    if nums2.count < nums1.count {
        shorter = nums2
        longer = nums1
    }

    var left = 0, right = shorter.count

    while left <= right {
        let i = (left + right) / 2
        let j = mid - i
        
        let shorterLeft = i > 0 ? shorter[i - 1] : Int.min
        let shorterRight = i < shorter.count ? shorter[i] : Int.max
        let longerLeft = j > 0 ? longer[j - 1] : Int.min
        let longerRight = j < longer.count ? longer[j] : Int.max

        if shorterLeft <= longerRight && longerLeft <= shorterRight {
            if length % 2 != 0 { return Double(max(shorterLeft, longerLeft)) }

            return Double((max(shorterLeft, longerLeft) + min(shorterRight, longerRight))) / 2.0
        } else if shorterLeft > longerRight {
            right = i - 1
        } else {
            left = i + 1
        }
    }

    return 0.0
}

print(findMedianSortedArrays([1,3], [2]))
print(findMedianSortedArrays([1,2], [3,4]))