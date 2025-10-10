class Solution {
    func minTime(_ skill: [Int], _ mana: [Int]) -> Int {
        let n = skill.count
        let m = mana.count
        var done = [Int](repeating: 0, count: n + 1)
        
        for j in 0..<m {
            for i in 0..<n {
                done[i + 1] = max(done[i + 1], done[i]) + mana[j] * skill[i]
            }
            for i in stride(from: n - 1, through: 1, by: -1) {
                done[i] = done[i + 1] - mana[j] * skill[i]
            }
        }
        
        return done[n]
    }
}