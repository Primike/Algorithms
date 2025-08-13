class Solution {
    func maxDifference(_ s: String, _ k: Int) -> Int {
        func getStatus(cntA: Int, cntB: Int) -> Int {
            return ((cntA & 1) << 1) | (cntB & 1)
        }

        let sChars = Array(s)
        let n = sChars.count
        var ans = Int.min

        for aStr in ["0", "1", "2", "3", "4"] {
            guard let charA = aStr.first else { continue }

            for bStr in ["0", "1", "2", "3", "4"] {
                guard let charB = bStr.first else { continue }

                if charA == charB {
                    continue
                }

                var best = [Int](repeating: Int.max, count: 4)
                var cntA = 0
                var cntB = 0
                var prevA = 0
                var prevB = 0
                var left = -1

                for right in 0..<n {
                    if sChars[right] == charA { cntA += 1 }
                    if sChars[right] == charB { cntB += 1 }

                    while right - left >= k && cntB - prevB >= 2 {
                        let leftStatus = getStatus(cntA: prevA, cntB: prevB)
                        best[leftStatus] = min(best[leftStatus], prevA - prevB)

                        left += 1
                        if sChars[left] == charA { prevA += 1 }
                        if sChars[left] == charB { prevB += 1 }
                    }

                    let rightStatus = getStatus(cntA: cntA, cntB: cntB)
                    let checkIndex = rightStatus ^ 0b10
                    
                    if best[checkIndex] != Int.max {
                        ans = max(ans, cntA - cntB - best[checkIndex])
                    }
                }
            }
        }
        return ans
    }
}