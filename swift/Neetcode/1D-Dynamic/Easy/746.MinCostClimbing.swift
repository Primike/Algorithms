// You are given an integer array cost where cost[i] 
// is the cost of ith step on a staircase. 
// Once you pay the cost, you can either climb one or two steps.
// You can either start from the step with index 0, or the step with index 1.
// Return the minimum cost to reach the top of the floor.

func minCostClimbingStairs(_ cost: [Int]) -> Int {
    var tab = Array(repeating: 0, count: cost.count + 1)

    for i in 2..<tab.count {
        tab[i] = min(tab[i - 2] + cost[i - 2], tab[i - 1] + cost[i - 1])
    }

    return tab[tab.count - 1]
}

print(minCostClimbingStairs([10,15,20]))
print(minCostClimbingStairs([1,100,1,1,1,100,1,1,100,1]))