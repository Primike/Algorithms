class Solution {
    func maxEvents(_ events: [[Int]]) -> Int {
        let n = events.count
        guard n > 0 else { return 0 }
        
        let maxDay = events.map { $0[1] }.max() ?? 0
        let sortedEvents = events.sorted { $0[0] < $1[0] }

        var pq = Heap<Int>(.minHeap)
        var ans = 0
        var j = 0

        for i in 1...maxDay {
            while j < n && sortedEvents[j][0] <= i {
                pq.push(sortedEvents[j][1])
                j += 1
            }

            while !pq.isEmpty && pq.peek()! < i {
                _ = pq.pop()
            }

            if !pq.isEmpty {
                _ = pq.pop()
                ans += 1
            }
        }
        
        return ans
    }
}