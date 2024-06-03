// We stack glasses in a pyramid, where the first row has 1 glass, 
// the second row has 2 glasses, and so on until the 100th row.  
// Each glass holds one cup of champagne.
// Now after pouring some non-negative integer cups of champagne, 
// return how full the jth glass in the ith row is (both i and j are 0-indexed.)

func champagneTower(_ poured: Int, _ query_row: Int, _ query_glass: Int) -> Double {
    var tower = Array(repeating: Array(repeating: 0.0, count: 101), count: 101)
    tower[0][0] = Double(poured)
    
    for i in 0..<100 {
        for j in 0...i {
            if tower[i][j] > 1.0 {
                let overflow = (tower[i][j] - 1.0) / 2.0
                tower[i + 1][j] += overflow
                tower[i + 1][j + 1] += overflow
                tower[i][j] = 1.0
            }
        }
    }
    
    return tower[query_row][query_glass]
}

print(champagneTower(1, 1, 1))
print(champagneTower(2, 1, 1))
print(champagneTower(100000009, 33, 17))