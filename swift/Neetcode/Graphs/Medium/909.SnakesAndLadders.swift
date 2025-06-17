class Solution {
    func snakesAndLadders(_ board: [[Int]]) -> Int {
        let n = board.count
        var cells = Array(repeating: (row: 0, col: 0), count: n * n + 1)
        var label = 1
        var columns = Array(0..<n)
        for row in stride(from: n - 1, through: 0, by: -1) {
            for column in columns {
                cells[label] = (row, column)
                label += 1
            }
            columns.reverse()
        }
        var dist = Array(repeating: -1, count: n * n + 1)
        var queue = [Int]()
        queue.append(1)
        dist[1] = 0
        var head = 0
        while head < queue.count {
            let curr = queue[head]
            head += 1
            if curr == n * n { return dist[curr] }
            for next in (curr + 1)...min(curr + 6, n * n) {
                let cell = cells[next]
                let value = board[cell.row][cell.col]
                let destination = value != -1 ? value : next
                if dist[destination] == -1 {
                    dist[destination] = dist[curr] + 1
                    queue.append(destination)
                }
            }
        }
        return dist[n * n]
    }
}