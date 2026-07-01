class Solution {
    func maxJumps(_ arr: [Int], _ d: Int) -> Int {
        let n = arr.count
        var seen = [Int: Int]()
        
        func dfs(_ pos: Int) {
            if seen[pos] != nil {
                return
            }
            seen[pos] = 1
            
            var i = pos - 1
            while i >= 0 && pos - i <= d && arr[pos] > arr[i] {
                dfs(i)
                if let childMax = seen[i] {
                    seen[pos] = max(seen[pos]!, childMax + 1)
                }
                i -= 1
            }
            
            i = pos + 1
            while i < n && i - pos <= d && arr[pos] > arr[i] {
                dfs(i)
                if let childMax = seen[i] {
                    seen[pos] = max(seen[pos]!, childMax + 1)
                }
                i += 1
            }
        }
        
        for i in 0..<n {
            dfs(i)
        }
        
        return seen.values.max() ?? 0
    }
}