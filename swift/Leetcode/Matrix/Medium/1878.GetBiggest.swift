class Answer {
    private var ans: [Int] = [0, 0, 0]

    func put(_ x: Int) {
        if x > ans[0] {
            ans[2] = ans[1]
            ans[1] = ans[0]
            ans[0] = x
        } else if x != ans[0] && x > ans[1] {
            ans[2] = ans[1]
            ans[1] = x
        } else if x != ans[0] && x != ans[1] && x > ans[2] {
            ans[2] = x
        }
    }

    func get() -> [Int] {
        return ans.filter { $0 != 0 }
    }
}

class Solution {
    func getBiggestThree(_ grid: [[Int]]) -> [Int] {
        let m = grid.count
        let n = grid[0].count
        var sum1 = Array(repeating: Array(repeating: 0, count: n + 2), count: m + 1)
        var sum2 = Array(repeating: Array(repeating: 0, count: n + 2), count: m + 1)

        for i in 1...m {
            for j in 1...n {
                sum1[i][j] = sum1[i - 1][j - 1] + grid[i - 1][j - 1]
                sum2[i][j] = sum2[i - 1][j + 1] + grid[i - 1][j - 1]
            }
        }

        let answer = Answer()
        for i in 0..<m {
            for j in 0..<n {
                answer.put(grid[i][j])
                
                var k = i + 2
                while k < m {
                    let ux = i, uy = j
                    let dx = k, dy = j
                    let lx = (i + k) / 2, ly = j - (k - i) / 2
                    let rx = (i + k) / 2, ry = j + (k - i) / 2

                    if ly < 0 || ry >= n {
                        break
                    }

                    let currentSum = (sum2[lx + 1][ly + 1] - sum2[ux][uy + 2]) +
                                     (sum1[rx + 1][ry + 1] - sum1[ux][uy]) +
                                     (sum1[dx + 1][dy + 1] - sum1[lx][ly]) +
                                     (sum2[dx + 1][dy + 1] - sum2[rx][ry + 2]) -
                                     (grid[ux][uy] + grid[dx][dy] + grid[lx][ly] + grid[rx][ry])
                    
                    answer.put(currentSum)
                    k += 2
                }
            }
        }

        return answer.get()
    }
}