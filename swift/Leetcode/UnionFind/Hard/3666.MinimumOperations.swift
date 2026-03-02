class Solution {
    func minOperations(_ s: String, _ k: Int) -> Int {
        let n = s.count
        let mInitial = s.filter { $0 == "0" }.count
        if mInitial == 0 { return 0 }

        var dist = Array(repeating: -1, count: n + 1)
        var parent = Array(0...(n + 2)) 
        
        func find(_ i: Int) -> Int {
            if parent[i] == i { return i }
            parent[i] = find(parent[i])
            return parent[i]
        }

        var queue = [mInitial]
        var head = 0
        dist[mInitial] = 0
        parent[mInitial] = find(mInitial + 2)
        
        while head < queue.count {
            let m = queue[head]
            head += 1
            
            let c1 = max(k - n + m, 0)
            let c2 = min(m, k)
            let lnode = m + k - 2 * c2
            let rnode = m + k - 2 * c1
            
            var curr = find(lnode)
            while curr <= rnode {
                dist[curr] = dist[m] + 1
                if curr == 0 { return dist[curr] }
                
                queue.append(curr)
                parent[curr] = find(curr + 2)
                curr = find(curr)
            }
        }
        
        return dist[0]
    }
}