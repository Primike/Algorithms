class Solution {
    func maxPower(_ stations: [Int], _ r: Int, _ k: Int) -> Int {
        let n = stations.count
        var cnt = [Int](repeating: 0, count: n + 1)

        for i in 0..<n {
            let left = max(0, i - r)
            let right = min(n, i + r + 1)
            cnt[left] += stations[i]
            if right <= n {
                cnt[right] -= stations[i]
            }
        }

        func check(_ val: Int) -> Bool {
            var diff = cnt
            var total = 0
            var remaining = k

            for i in 0..<n {
                total += diff[i]
                if total < val {
                    let add = val - total
                    if remaining < add {
                        return false
                    }
                    remaining -= add
                    let end = min(n, i + 2 * r + 1)
                    if end <= n {
                        diff[end] -= add
                    }
                    total += add
                }
            }
            return true
        }

        var lo = stations.min() ?? 0
        var hi = stations.reduce(0, +) + k
        var res = 0
        
        while lo <= hi {
            let mid = lo + (hi - lo) / 2
            if check(mid) {
                res = mid
                lo = mid + 1
            } else {
                hi = mid - 1
            }
        }
        return res
    }
}