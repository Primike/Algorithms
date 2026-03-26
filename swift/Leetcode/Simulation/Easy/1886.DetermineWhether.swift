class Solution {
    func findRotation(_ mat: [[Int]], _ target: [[Int]]) -> Bool {
        var currentMat = mat
        let n = currentMat.count
        
        for _ in 0..<4 {
            for i in 0..<(n / 2) {
                for j in 0..<((n + 1) / 2) {
                    let temp = currentMat[i][j]
                    currentMat[i][j] = currentMat[n - 1 - j][i]
                    currentMat[n - 1 - j][i] = currentMat[n - 1 - i][n - 1 - j]
                    currentMat[n - 1 - i][n - 1 - j] = currentMat[j][n - 1 - i]
                    currentMat[j][n - 1 - i] = temp
                }
            }
            
            if currentMat == target {
                return true
            }
        }
        
        return false
    }
}