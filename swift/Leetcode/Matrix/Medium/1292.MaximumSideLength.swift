class Solution {
    private func isValid(_ pref: [[Int]], _ k: Int, _ limit: Int) -> Bool {
        let n = pref.count
        let m = pref[0].count

        for i in (k - 1)..<n {
            for j in (k - 1)..<m {
                let x1 = i - k + 1
                let y1 = j - k + 1

                let sum = pref[i][j]
                        - (x1 > 0 ? pref[x1 - 1][j] : 0)
                        - (y1 > 0 ? pref[i][y1 - 1] : 0)
                        + (x1 > 0 && y1 > 0 ? pref[x1 - 1][y1 - 1] : 0)

                if sum <= limit {
                    return true
                }
            }
        }
        return false
    }

    func maxSideLength(_ mat: [[Int]], _ threshold: Int) -> Int {
        let n = mat.count
        let m = mat[0].count

        var pref = mat

        for i in 0..<n {
            for j in 1..<m {
                pref[i][j] += pref[i][j - 1]
            }
        }

        for j in 0..<m {
            for i in 1..<n {
                pref[i][j] += pref[i - 1][j]
            }
        }

        var low = 1
        var high = min(n, m)
        var ans = 0

        while low <= high {
            let mid = (low + high) / 2
            if isValid(pref, mid, threshold) {
                ans = mid
                low = mid + 1
            } else {
                high = mid - 1
            }
        }

        return ans
    }
}