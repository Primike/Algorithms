fileprivate struct PointKey: Hashable {
    let x: Int
    let y: Int
}

class Solution {
    func numberOfPairs(_ points: [[Int]]) -> Int {
        var col: [Int: Int] = [:]
        var row: [Int: Int] = [:]
        var coordinatesMap: [PointKey: (c: Int, r: Int)] = [:]

        for point in points {
            col[point[0]] = 0
            row[point[1]] = 0
        }

        let sortedColKeys = col.keys.sorted()
        for (idx, key) in sortedColKeys.enumerated() {
            col[key] = idx + 1
        }

        let sortedRowKeys = row.keys.sorted()
        for (idx, key) in sortedRowKeys.enumerated() {
            row[key] = idx + 1
        }

        let nc = col.count + 1
        let nr = row.count + 1
        var m = Array(repeating: Array(repeating: 0, count: nr), count: nc)
        var prefixSum = Array(repeating: Array(repeating: 0, count: nr), count: nc)

        for point in points {
            let x = point[0]
            let y = point[1]
            if let c = col[x], let r = row[y] {
                coordinatesMap[PointKey(x: x, y: y)] = (c, r)
                m[c][r] = 1
            }
        }

        for i in 1..<nc {
            for j in 1..<nr {
                prefixSum[i][j] = prefixSum[i - 1][j] + prefixSum[i][j - 1] - prefixSum[i - 1][j - 1] + m[i][j]
            }
        }

        var ans = 0
        var sortedPoints = points
        sortedPoints.sort { p1, p2 in
            if p1[0] != p2[0] {
                return p1[0] < p2[0]
            } else {
                return p1[1] > p2[1]
            }
        }

        let n = sortedPoints.count
        for i in 0..<(n - 1) {
            for j in (i + 1)..<n {
                let p1 = sortedPoints[i]
                let p2 = sortedPoints[j]

                if p1[1] >= p2[1] {
                    let key1 = PointKey(x: p1[0], y: p1[1])
                    let key2 = PointKey(x: p2[0], y: p2[1])

                    if let (c1, r1) = coordinatesMap[key1], let (c2, r2) = coordinatesMap[key2] {
                        let cnt = prefixSum[c2][r1] - prefixSum[c1 - 1][r1] - prefixSum[c2][r2 - 1] + prefixSum[c1 - 1][r2 - 1]
                        if cnt == 2 {
                            ans += 1
                        }
                    }
                }
            }
        }

        return ans
    }
}