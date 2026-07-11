class Solution {
    func getResults(_ queries: [[Int]]) -> [Bool] {
        let mx = 50000
        var st = [0, mx]
        
        for q in queries {
            if q[0] == 1 {
                let x = q[1]
                let idx = bisectLeft(st, x)
                st.insert(x, at: idx)
            }
        }
        
        var bt = Array(repeating: 0, count: mx + 1)
        
        func update(_ x: Int, _ v: Int) {
            var idx = x
            while idx < bt.count {
                if v > bt[idx] {
                    bt[idx] = v
                }
                idx += idx & -idx
            }
        }
        
        func query(_ x: Int) -> Int {
            var res = 0
            var idx = x
            while idx > 0 {
                if bt[idx] > res {
                    res = bt[idx]
                }
                idx -= idx & -idx
            }
            return res
        }
        
        var pre = 0
        for x in st {
            if x == 0 { continue }
            update(x, x - pre)
            pre = x
        }
        
        var ans = [Bool]()
        
        for q in queries.reversed() {
            if q[0] == 2 {
                let x = q[1]
                let sz = q[2]
                let idx = bisectLeft(st, x)
                
                let preVal = (idx < st.count && st[idx] == x) ? x : st[idx - 1]
                
                var maxSpace = query(preVal)
                maxSpace = max(maxSpace, x - preVal)
                ans.append(maxSpace >= sz)
            } else {
                let x = q[1]
                let idx = bisectLeft(st, x)
                let preVal = st[idx - 1]
                let nxt = st[idx + 1]
                
                update(nxt, nxt - preVal)
                st.remove(at: idx)
            }
        }
        
        return ans.reversed()
    }
    
    private func bisectLeft(_ array: [Int], _ value: Int) -> Int {
        var low = 0
        var high = array.count
        while low < high {
            let mid = low + (high - low) / 2
            if array[mid] < value {
                low = mid + 1
            } else {
                high = mid
            }
        }
        return low
    }
}