class Solution {
    func minSwaps(_ grid: [[Int]]) -> Int {
        let n = grid.count
        var trailingZeros = Array(repeating: 0, count: n)
        
        for i in 0..<n {
            var count = 0
            for j in stride(from: n - 1, through: 0, by: -1) {
                if grid[i][j] == 0 {
                    count += 1
                } else {
                    break
                }
            }
            trailingZeros[i] = count
        }
        
        var res = 0
        for i in 0..<n {
            let required = n - 1 - i
            var found = false
            
            for j in i..<n {
                if trailingZeros[j] >= required {
                    res += (j - i)
                    let temp = trailingZeros.remove(at: j)
                    trailingZeros.insert(temp, at: i)
                    found = true
                    break
                }
            }
            
            if !found { return -1 }
        }
        
        return res
    }
}