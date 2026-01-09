class DSU {
    var root: [Int]
    var size: [Int]

    init(_ n: Int) {
        self.root = Array(0..<n)
        self.size = Array(repeating: 1, count: n)
    }

    func find(_ x: Int) -> Int {
        if root[x] != x {
            root[x] = find(root[x])
        }
        return root[x]
    }

    func union(_ x: Int, _ y: Int) {
        var rootX = find(x)
        var rootY = find(y)

        if rootX == rootY {
            return
        }

        if size[rootX] > size[rootY] {
            (rootX, rootY) = (rootY, rootX)
        }
        root[rootX] = rootY
        size[rootY] += size[rootX]
    }
}

class Solution {
    func latestDayToCross(_ row: Int, _ col: Int, _ cells: [[Int]]) -> Int {
        let dsu = DSU(row * col + 2)
        var grid = Array(repeating: Array(repeating: 0, count: col), count: row)
        let directions = [(0, 1), (0, -1), (1, 0), (-1, 0), (1, 1), (1, -1), (-1, 1), (-1, -1)]

        for i in 0..<(row * col) {
            let r = cells[i][0] - 1
            let c = cells[i][1] - 1
            grid[r][c] = 1
            let index1 = r * col + c + 1

            for (dr, dc) in directions {
                let newR = r + dr
                let newC = c + dc
                let index2 = newR * col + newC + 1

                if newR >= 0 && newR < row && newC >= 0 && newC < col && grid[newR][newC] == 1 {
                    dsu.union(index1, index2)
                }
            }

            if c == 0 {
                dsu.union(0, index1)
            }
            if c == col - 1 {
                dsu.union(row * col + 1, index1)
            }

            if dsu.find(0) == dsu.find(row * col + 1) {
                return i
            }
        }
        return -1
    }
}