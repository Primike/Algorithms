class Solution {
    func reverseSubmatrix(_ grid: [[Int]], _ x: Int, _ y: Int, _ k: Int) -> [[Int]] {
        var res = grid
        var i0 = x
        var i1 = x + k - 1
        
        while i0 < i1 {
            for j in y..<(y + k) {
                let temp = res[i0][j]
                res[i0][j] = res[i1][j]
                res[res.index(res.startIndex, offsetBy: i1)][j] = temp
            }
            i0 += 1
            i1 -= 1
        }
        
        return res
    }
}