class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var arr = arr
        
        func dfs(_ position: Int) -> Bool {
            if position >= 0 && position < arr.count && arr[position] >= 0 {
                if arr[position] == 0 {
                    return true
                }
                
                arr[position] = -arr[position]
                return dfs(position + arr[position]) || dfs(position - arr[position])
            }
            return false
        }
        
        return dfs(start)
    }
}