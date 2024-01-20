// Given a triangle array, return the minimum path sum from top to bottom.

// Time: O(n^2), Space: O(n)
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


func minimumTotal2(_ triangle: [[Int]]) -> Int {
    let triangle = Array(triangle.reversed())
    var tab = triangle.map { Array(repeating: 0, count: $0.count) }
    tab.insert(Array(repeating: 0, count: triangle[0].count + 1), at: 0)

    for i in 1..<tab.count {
        for j in 0..<tab[i].count {
            tab[i][j] = min(tab[i - 1][j], tab[i - 1][j + 1]) + triangle[i - 1][j]
        }
    }

    return tab[tab.count - 1][0]
}

func minimumTotal3(_ triangle: [[Int]]) -> Int {
    var memo = [String: Int]()

    func dp(_ i: Int, _ j: Int) -> Int {
        let key = "\(i),\(j)"

        if i >= triangle.count { return 0 }
        if let value = memo[key] { return value }

        var result = min(dp(i + 1, j), dp(i + 1, j + 1)) + triangle[i][j]
        memo[key] = result
        return result
    }

    return dp(0, 0)
}