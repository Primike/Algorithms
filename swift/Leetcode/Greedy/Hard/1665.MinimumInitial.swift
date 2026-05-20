class Solution {
    func minimumEffort(_ tasks: [[Int]]) -> Int {
        var tasks = tasks
        tasks.sort { ($0[1] - $0[0]) > ($1[1] - $1[0]) }
        
        var ans = 0
        var remain = 0
        
        for task in tasks {
            let actual = task[0]
            let minimum = task[1]
            
            if remain < minimum {
                ans += (minimum - remain)
                remain = minimum
            }
            remain -= actual
        }
        
        return ans
    }
}