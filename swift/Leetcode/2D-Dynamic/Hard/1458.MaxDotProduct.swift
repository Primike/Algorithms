// Return the maximum dot product between non-empty subsequences of 
// nums1 and nums2 with the same length.

// Time: O(m * n), Space: O(m * n)
func maxDotProduct(_ nums1: [Int], _ nums2: [Int]) -> Int {
    let n1 = nums1.count, n2 = nums2.count
    var tab = Array(repeating: Array(repeating: 0, count: n2), count: n1)

    for i in 0..<n1 {
        for j in 0..<n2 {
            tab[i][j] = nums1[i] * nums2[j]
            
            if i > 0, j > 0 { tab[i][j] = max(tab[i][j], tab[i][j] + tab[i - 1][j - 1]) }
            if i > 0 { tab[i][j] = max(tab[i][j], tab[i - 1][j]) }
            if j > 0 { tab[i][j] = max(tab[i][j], tab[i][j - 1]) }
        }
    }

    return tab[n1 - 1][n2 - 1]
}

print(maxDotProduct([2,1,-2,5], [3,0,-6]))
print(maxDotProduct([3,-2], [2,-6,7]))
print(maxDotProduct([-1,-1], [1,1]))