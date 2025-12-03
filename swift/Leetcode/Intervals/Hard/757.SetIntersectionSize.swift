class Solution {
    func intersectionSizeTwo(_ intervals: [[Int]]) -> Int {
        var intervals = intervals.sorted {
            if $0[0] != $1[0] {
                return $0[0] < $1[0]
            } else {
                return $0[1] > $1[1]
            }
        }
        var todo = Array(repeating: 2, count: intervals.count)
        var ans = 0
        while !intervals.isEmpty {
            let curr = intervals.removeLast()
            let s = curr[0]
            let t = todo.removeLast()
            for p in s..<(s + t) {
                for i in 0..<intervals.count {
                    if todo[i] > 0 && p <= intervals[i][1] {
                        todo[i] -= 1
                    }
                }
                ans += 1
            }
        }
        return ans
    }
}