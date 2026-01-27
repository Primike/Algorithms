class Solution {
    func largestSquareArea(_ bottomLeft: [[Int]], _ topRight: [[Int]]) -> Int {
        var maxSize = 0
        let n = bottomLeft.count
        
        for i in 0..<n {
            for j in (i + 1)..<n {
                let xOverlap = min(topRight[i][0], topRight[j][0]) - max(bottomLeft[i][0], bottomLeft[j][0])
                let yOverlap = min(topRight[i][1], topRight[j][1]) - max(bottomLeft[i][1], bottomLeft[j][1])
                
                if xOverlap > 0 && yOverlap > 0 {
                    let side = min(xOverlap, yOverlap)
                    maxSize = max(maxSize, side)
                }
            }
        }
        
        return maxSize * maxSize
    }
}