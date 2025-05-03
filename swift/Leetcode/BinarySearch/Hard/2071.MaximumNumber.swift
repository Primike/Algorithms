class Solution {
    func maxTaskAssign(_ tasks: [Int], _ workers: [Int], _ pills: Int, _ strength: Int) -> Int {
        let n = tasks.count
        let m = workers.count
        let sortedTasks = tasks.sorted()
        let sortedWorkers = workers.sorted()

        func check(_ k: Int) -> Bool {
            if k == 0 { return true }
            var p = pills
            var ws: [Int] = []
            var ptr = m - 1

            for i in stride(from: k - 1, through: 0, by: -1) {
                let currentTask = sortedTasks[i]

                while ptr >= m - k && sortedWorkers[ptr] + strength >= currentTask {
                    ws.insert(sortedWorkers[ptr], at: 0)
                    ptr -= 1
                }

                if ws.isEmpty {
                    return false
                }

                if let strongestWorker = ws.last, strongestWorker >= currentTask {
                    ws.removeLast()
                } else {
                    if p == 0 {
                        return false
                    }
                    p -= 1
                    ws.removeFirst()
                }
            }
            return true
        }

        var left = 0
        var right = min(m, n)
        var ans = 0

        while left <= right {
            let mid = left + (right - left) / 2
            if check(mid) {
                ans = mid
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        return ans
    }
}