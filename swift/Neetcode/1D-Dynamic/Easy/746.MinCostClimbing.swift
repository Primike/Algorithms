// You are given an integer array cost where cost[i] 
// is the cost of ith step on a staircase. 
// Once you pay the cost, you can either climb one or two steps.
// You can either start from the step with index 0, or the step with index 1.
// Return the minimum cost to reach the top of the floor.

// Time: O(n), Space: O(1)
func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var cost1 = 0, cost2 = 0

    for i in 2...cost.count {
        let temp = cost2
        cost2 = min(cost[i - 1] + cost2, cost[i - 2] + cost1)
        cost1 = temp
    }

    return cost2
}

print(minCostClimbingStairs([10,15,20]))
print(minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1]))