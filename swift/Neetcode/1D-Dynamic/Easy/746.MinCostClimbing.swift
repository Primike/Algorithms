// You are given an integer array cost where cost[i] 
// is the cost of ith step on a staircase. 
// Once you pay the cost, you can either climb one or two steps.
// You can either start from the step with index 0, or the step with index 1.
// Return the minimum cost to reach the top of the floor.

func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var cost = cost
    
    for i in stride(from: cost.count - 3, to: -1, by: -1) {
        cost[i] += min(cost[i + 1], cost[i + 2])
    }

    return min(cost[0], cost[1])
}

print(minCostClimbingStairs([10,15,20]))
print(minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1]))