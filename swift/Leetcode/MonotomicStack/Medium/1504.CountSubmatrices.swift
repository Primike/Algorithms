class Solution {
    func numSubmat(_ mat: [[Int]]) -> Int {
        guard let firstRow = mat.first, !firstRow.isEmpty else {
            return 0
        }

        var heights = [Int](repeating: 0, count: firstRow.count)
        var res = 0

        for row in mat {
            for i in 0..<row.count {
                heights[i] = (row[i] == 0) ? 0 : heights[i] + 1
            }

            var stack: [[Int]] = [[-1, 0, -1]]
            
            for (i, h) in heights.enumerated() {
                while let last = stack.last, last[2] >= h {
                    stack.removeLast()
                }

                let j = stack.last![0]
                let prev = stack.last![1]
                let cur = prev + (i - j) * h
                
                stack.append([i, cur, h])
                res += cur
            }
        }
        
        return res
    }
}