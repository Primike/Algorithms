class Solution {
    func countTrapezoids(_ points: [[Int]]) -> Int {
        let n = points.count
        let inf = 1_000_000_007.0
        var slopeToIntercept = [Double: [Double]]()
        var midToSlope = [Int: [Double]]()
        var ans = 0

        for i in 0..<n {
            let x1 = points[i][0]
            let y1 = points[i][1]
            for j in (i + 1)..<n {
                let x2 = points[j][0]
                let y2 = points[j][1]
                let dx = Double(x1 - x2)
                let dy = Double(y1 - y2)

                let k: Double
                let b: Double

                if x2 == x1 {
                    k = inf
                    b = Double(x1)
                } else {
                    k = (Double(y2) - Double(y1)) / (Double(x2) - Double(x1))
                    b = (Double(y1) * dx - Double(x1) * dy) / dx
                }

                let mid = (x1 + x2) * 10000 + (y1 + y2)
                slopeToIntercept[k, default: []].append(b)
                midToSlope[mid, default: []].append(k)
            }
        }

        for sti in slopeToIntercept.values {
            if sti.count == 1 { continue }

            var cnt = [Double: Int]()
            for bVal in sti {
                cnt[bVal, default: 0] += 1
            }

            var totalSum = 0
            for count in cnt.values {
                ans += totalSum * count
                totalSum += count
            }
        }

        for mts in midToSlope.values {
            if mts.count == 1 { continue }

            var cnt = [Double: Int]()
            for kVal in mts {
                cnt[kVal, default: 0] += 1
            }

            var totalSum = 0
            for count in cnt.values {
                ans -= totalSum * count
                totalSum += count
            }
        }

        return ans
    }
}