class Solution {
    func minimumCost(_ cost: [Int]) -> Int {
        let sortedCost = cost.sorted(by: >)
        var res = 0
        
        for i in 0..<sortedCost.count {
            if i % 3 != 2 {
                res += sortedCost[i]
            }
        }
        
        return res
    }
}