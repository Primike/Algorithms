// A frog is crossing a river. The river is divided into some number of units, 
// and at each unit, there may or may not exist a stone. 
// The frog can jump on a stone, but it must not jump into the water.
// Given a list of stones positions (in units) in sorted ascending order, 
// determine if the frog can cross the river by landing on the last stone. 
// Initially, the frog is on the first stone and assumes the first jump must be 1 unit.
// If the frog's last jump was k units, its next jump must be either k - 1, 
// k, or k + 1 units. The frog can only jump in the forward direction.

// Time: O(n^2), Space: O(n^2)
func canCross(_ stones: [Int]) -> Bool {
    let n = stones.count
    var dp = Array(repeating: Array(repeating: false, count: n), count: n)
    dp[0][0] = true

    for i in 1..<n {
        for j in 0..<i {
            let jump = stones[i] - stones[j]
            if jump > n - 1 || jump < 0 { continue }

            if dp[j][jump] { dp[i][jump] = true }
            if jump > 0, dp[j][jump - 1] { dp[i][jump] = true }
            if jump + 1 < n, dp[j][jump + 1] { dp[i][jump] = true }
        }
    }

    return dp[n - 1].contains(true)
}

print(canCross([0,1,3,5,6,8,12,17]))
print(canCross([0,1,2,3,4,8,9,11]))


func canCross(_ stones: [Int]) -> Bool {
    var stonesSet = Set(stones)
    var memo = [String: Bool]()

    func dp(_ position: Int, _ jump: Int) -> Bool {
        let key = "\(position),\(jump)"

        if !stonesSet.contains(position) { return false }
        if position < 0 || jump <= 0 { return false }
        if position == stones[stones.count - 1] { return true }
        if let value = memo[key] { return value }

        var result = false

        result = result || dp(position + jump - 1, jump - 1)
        result = result || dp(position + jump, jump)
        result = result || dp(position + jump + 1, jump + 1)

        memo[key] = result
        return result
    }

    return dp(1, 1)
}