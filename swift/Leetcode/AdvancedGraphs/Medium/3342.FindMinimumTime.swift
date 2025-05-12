struct State: Comparable {
    let x: Int
    let y: Int
    let dis: Int
    
    init(x: Int, y: Int, dis: Int) {
        self.x = x
        self.y = y
        self.dis = dis
    }
    
    static func < (lhs: State, rhs: State) -> Bool {
        return lhs.dis < rhs.dis
    }
}

class Solution {
    func minTimeToReach(_ moveTime: [[Int]]) -> Int {
        let n = moveTime.count
        guard n > 0 else { return 0 }
        let m = moveTime[0].count
        let inf = Int.max
        var d = Array(repeating: Array(repeating: inf, count: m), count: n)
        var v = Array(repeating: Array(repeating: false, count: m), count: n)
        
        let dirs = [(1, 0), (-1, 0), (0, 1), (0, -1)]
        
        d[0][0] = 0
        var heap = Heap<State>(.minHeap)
        heap.push(State(x: 0, y: 0, dis: 0))
        
        while !heap.isEmpty {
            guard let s = heap.pop() else { break }
            if v[s.x][s.y] {
                continue
            }
            if s.x == n - 1 && s.y == m - 1 {
                break
            }
            v[s.x][s.y] = true
            for dir in dirs {
                let nx = s.x + dir.0
                let ny = s.y + dir.1
                guard nx >= 0 && nx < n && ny >= 0 && ny < m else {
                    continue
                }
                let dist = max(d[s.x][s.y], moveTime[nx][ny]) + (s.x + s.y) % 2 + 1
                if d[nx][ny] > dist {
                    d[nx][ny] = dist
                    heap.push(State(x: nx, y: ny, dis: dist))
                }
            }
        }
        
        return d[n-1][m-1]
    }
}