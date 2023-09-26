// Given a triangle array, return the minimum path sum from top to bottom.

//Space Optimization
func minimumTotal(_ triangle: [[Int]]) -> Int {
    var tab = Array(repeating: 0, count: triangle[triangle.count - 1].count + 1)

    for row in triangle.reversed() {
        for (i, number) in row.enumerated() {
            tab[i] = number + min(tab[i], tab[i + 1])
        }
    }

    return tab[0]
}

print(minimumTotal([[2],[3,4],[6,5,7],[4,1,8,3]]))
print(minimumTotal([[-10]]))