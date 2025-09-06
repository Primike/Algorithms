class Solution {
    func numberOfPairs(_ points: [[Int]]) -> Int {
        var ans = 0
        let n = points.count

        for i in 0..<n {
            let pointA = points[i]
            for j in 0..<n {
                let pointB = points[j]
                
                if i == j || !(pointA[0] <= pointB[0] && pointA[1] >= pointB[1]) {
                    continue
                }
                
                if n == 2 {
                    ans += 1
                    continue
                }

                var illegal = false
                for k in 0..<n {
                    if k == i || k == j {
                        continue
                    }

                    let pointTmp = points[k]
                    let isXContained = pointTmp[0] >= pointA[0] && pointTmp[0] <= pointB[0]
                    let isYContained = pointTmp[1] <= pointA[1] && pointTmp[1] >= pointB[1]
                    
                    if isXContained && isYContained {
                        illegal = true
                        break
                    }
                }
                
                if !illegal {
                    ans += 1
                }
            }
        }
        return ans
    }
}