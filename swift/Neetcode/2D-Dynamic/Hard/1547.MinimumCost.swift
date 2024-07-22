// Given an integer array cuts where cuts[i] 
// denotes a position you should perform a cut at.
// You should perform the cuts in order, 
// you can change the order of the cuts as you wish.
// The cost of one cut is the length of the stick to be cut, 
// the total cost is the sum of costs of all cuts. 
// When you cut a stick, it will be split into two smaller sticks 
// (i.e. the sum of their lengths is the length of the stick before the cut).
// Return the minimum total cost of the cuts.

// Time: O(m^3), Space: O(m^2)
func minCost(_ n: Int, _ cuts: [Int]) -> Int {
    let cuts = [0] + cuts.sorted() + [n]
    var dp = Array(repeating: Array(repeating: 0, count: cuts.count), count: cuts.count)

    for length in 2..<cuts.count {
        for l in 0..<(cuts.count - length) {
            let r = l + length
            dp[l][r] = Int.max

            for i in (l + 1)..<r {
                dp[l][r] = min(dp[l][r], dp[l][i] + dp[i][r] + cuts[r] - cuts[l])
            }
        }
    }
    
    return dp[0][cuts.count - 1]
}

print(minCost(7, [1,3,4,5]))
print(minCost(9, [5,6,1,4,2]))


func minCost2(_ n: Int, _ cuts: [Int]) -> Int {
    let cuts = [0] + cuts.sorted() + [n]
    var memo = [String: Int]() 

    func dp(_ left: Int, _ right: Int) -> Int {
        let key = "\(left),\(right)"

        if right - left == 1 { return 0 }
        if let value = memo[key] { return value }

        var result = Int.max

        for i in (left + 1)..<right {
            result = min(result, dp(left, i) + dp(i, right))
        }

        result += cuts[right] - cuts[left]
        memo[key] = result
        return result
    }

    return dp(0, cuts.count - 1)
}