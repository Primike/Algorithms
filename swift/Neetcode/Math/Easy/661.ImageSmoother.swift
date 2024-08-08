// An image smoother is a filter of the size 3 x 3 that can be applied to 
// each cell of an image by rounding down the average of the cell and the 
// eight surrounding cells (i.e., the average of the nine cells in the blue smoother). 
// If one or more of the surrounding cells of a cell is not present, 
// we do not consider it in the average 
// (i.e., the average of the four cells in the red smoother).

// Time: O(m * n), Space: O(m * n)
func imageSmoother(_ img: [[Int]]) -> [[Int]] {
    let rows = img.count, cols = img[0].count
    var result = Array(repeating: Array(repeating: 0, count: cols), count: rows)
    let directions = [(1, 0), (-1, 0), (0, 1), (0, -1), (1, 1), (1, -1), (-1, 1), (-1, -1)]

    for i in 0..<rows {
        for j in 0..<cols {
            var sum = img[i][j]
            var count = 1

            for (di, dj) in directions {
                let r = i + di, c = j + dj

                if r < 0 || r >= rows || c < 0 || c >= cols { continue }

                sum += img[r][c]
                count += 1 
            }

            result[i][j] = sum / count
        }
    }

    return result
}

print(imageSmoother([[1,1,1],[1,0,1],[1,1,1]]))
print(imageSmoother([[100,200,100],[200,50,200],[100,200,100]]))