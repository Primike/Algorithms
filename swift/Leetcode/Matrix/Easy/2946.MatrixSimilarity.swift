class Solution {
    func areSimilar(_ mat: [[Int]], _ k: Int) -> Bool {
        let m = mat.count
        let n = mat[0].count
        let offset = k % n
        
        for i in 0..<m {
            for j in 0..<n {
                if mat[i][j] != mat[i][(j + offset) % n] {
                    return false
                }
            }
        }
        
        return true
    }
}