class Solution {
    func kthSmallestProduct(_ nums1: [Int], _ nums2: [Int], _ k: Int) -> Int {
        var low: Int64 = -10000000001
        var high: Int64 = 10000000001
        let longK = Int64(k)

        while low < high {
            let mid = low + (high - low) / 2
            if countLessEqual(mid, nums1, nums2) >= longK {
                high = mid
            } else {
                low = mid + 1
            }
        }
        return Int(low)
    }

    private func countLessEqual(_ x: Int64, _ nums1: [Int], _ nums2: [Int]) -> Int64 {
        var totalCount: Int64 = 0
        for n1_int in nums1 {
            let n1 = Int64(n1_int)
            if n1 == 0 {
                if x >= 0 {
                    totalCount += Int64(nums2.count)
                }
                continue
            }
            if n1 > 0 {
                var l = 0, r = nums2.count
                while l < r {
                    let mid = l + (r - l) / 2
                    if Int64(nums2[mid]) * n1 > x {
                        r = mid
                    } else {
                        l = mid + 1
                    }
                }
                totalCount += Int64(l)
            } else {
                var l = 0, r = nums2.count
                while l < r {
                    let mid = l + (r - l) / 2
                    if Int64(nums2[mid]) * n1 <= x {
                        r = mid
                    } else {
                        l = mid + 1
                    }
                }
                totalCount += Int64(nums2.count - l)
            }
        }
        return totalCount
    }
}