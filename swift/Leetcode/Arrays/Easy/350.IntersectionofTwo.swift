// Given two integer arrays nums1 and nums2, 
// return an array of their intersection. 
// Each element in the result must appear as many times as it shows 
// in both arrays and you may return the result in any order.

// Time: O(n), Space: O(n)
func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
    var nums2 = nums2.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = [Int]()

    for number in nums1 {
        if let _ = nums2[number] {
            result.append(number)
            nums2[number]! -= 1

            if nums2[number]! == 0 { nums2[number] = nil }
        }
    }

    return result
}

print(intersect([1,2,2,1], [2,2]))
print(intersect([4,9,5], [9,4,9,8,4]))