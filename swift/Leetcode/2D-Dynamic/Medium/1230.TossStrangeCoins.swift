// You have some coins.  The i-th coin has a probability 
// prob[i] of facing heads when tossed.
// Return the probability that the number of coins 
// facing heads equals target if you toss every coin exactly once.

// Time: O(n * t), Space: O(n * t)
func probabilityOfHeads(_ prob: [Double], _ target: Int) -> Double {
    var memo = [String: Double]()
    
    func dp(_ i: Int, _ target: Int) -> Double {
        let key = "\(i),\(target)"

        if target < 0 { return 0.0 }
        if i == prob.count { return target == 0 ? 1.0 : 0.0 }
        if let value = memo[key] { return value }
        
        let heads = dp(i + 1, target - 1) * prob[i]
        let tails = dp(i + 1, target) * (1.0 - prob[i])
        let result = heads + tails
        
        memo[key] = result
        return result
    }
    
    return dp(0, target)
}

print(probabilityOfHeads([0.4], 1))
print(probabilityOfHeads([0.5,0.5,0.5,0.5,0.5], 0))