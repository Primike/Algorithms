class Solution {
    func dietPlanPerformance(_ calories: [Int], _ k: Int, _ lower: Int, _ upper: Int) -> Int {
        var score = 0
        var sumCalories = 0
        
        for i in 0..<k {
            sumCalories += calories[i]
        }
        
        for i in k..<calories.count {
            if sumCalories < lower {
                score -= 1
            } else if sumCalories > upper {
                score += 1
            }
            sumCalories += calories[i] - calories[i - k]
        }
        
        if sumCalories < lower {
            score -= 1
        } else if sumCalories > upper {
            score += 1
        }
        
        return score
    }
}