class Solution {
    func maxDistance(_ nums1: [Int], _ nums2: [Int]) -> Int {
        var ans = 0
        var p1 = 0
        var p2 = 0
        let n1 = nums1.count
        let n2 = nums2.count

        while p1 < n1 && p2 < n2 {
            if nums1[p1] > nums2[p2] {
                p1 += 1
            } else {
                ans = max(ans, p2 - p1)
                p2 += 1
            }
        }

        return ans
    }
}