struct State: Comparable {
    let dist: Int
    let path: String
    let row: Int
    let col: Int
    
    static func < (lhs: State, rhs: State) -> Bool {
        if lhs.dist != rhs.dist {
            return lhs.dist < rhs.dist
        }
        return lhs.path < rhs.path
    }
}

class Solution {
    func findShortestWay(_ maze: [[Int]], _ ball: [Int], _ hole: [Int]) -> String {
        let m = maze.count
        let n = maze[0].count
        let hr = hole[0], hc = hole[1]
        
        func isValid(_ r: Int, _ c: Int) -> Bool {
            return r >= 0 && r < m && c >= 0 && c < n && maze[r][c] == 0
        }
        
        var minDists = Array(repeating: Array(repeating: Int.max, count: n), count: m)
        var minPaths = Array(repeating: Array(repeating: "", count: n), count: m)
        
        var heap = Heap<State>(.minHeap)
        heap.push(State(dist: 0, path: "", row: ball[0], col: ball[1]))
        minDists[ball[0]][ball[1]] = 0
        
        let directions = [(0, -1, "l"), (-1, 0, "u"), (0, 1, "r"), (1, 0, "d")]
        
        while let current = heap.pop() {
            if current.dist > minDists[current.row][current.col] && current.path > minPaths[current.row][current.col] {
                continue
            }
            
            if current.row == hr && current.col == hc {
                return current.path
            }
            
            for (dy, dx, dirChar) in directions {
                var nr = current.row
                var nc = current.col
                var d = 0
                
                while isValid(nr + dy, nc + dx) {
                    nr += dy
                    nc += dx
                    d += 1
                    if nr == hr && nc == hc { break }
                }
                
                if d > 0 {
                    let totalDist = current.dist + d
                    let totalPath = current.path + dirChar
                    
                    if totalDist < minDists[nr][nc] || (totalDist == minDists[nr][nc] && totalPath < minPaths[nr][nc]) {
                        minDists[nr][nc] = totalDist
                        minPaths[nr][nc] = totalPath
                        heap.push(State(dist: totalDist, path: totalPath, row: nr, col: nc))
                    }
                }
            }
        }
        
        return "impossible"
    }
}