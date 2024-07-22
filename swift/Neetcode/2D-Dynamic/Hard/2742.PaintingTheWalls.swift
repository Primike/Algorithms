// A paid painter that paints the ith wall in time[i] 
// units of time and takes cost[i] units of money.
// A free painter that paints any wall in 1 unit of time 
// at a cost of 0. But the free painter can only be used 
// if the paid painter is already occupied.
// Return the minimum amount of money required to paint the n walls.

// Time: O(n^2), Space: O(n^2)
func paintWalls(_ cost: [Int], _ time: [Int]) -> Int {
    let largest = cost.reduce(0, +)
    var memo = [String: Int]()

    func dp(_ i: Int, _ walls: Int) -> Int {
        let key = "\(i),\(walls)"

        if walls <= 0 { return 0 }
        if i == cost.count { return largest }
        if let value = memo[key] { return value }

        var result = dp(i + 1, walls - 1 - time[i]) + cost[i]
        result = min(result, dp(i + 1, walls))

        memo[key] = result
        return result
    }

    return dp(0, cost.count)
}

print(paintWalls([1,2,3,2], [1,2,3,2]))
print(paintWalls([2,3,4,2], [1,1,1,1]))