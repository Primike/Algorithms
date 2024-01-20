// There is a row of n houses, where each house can be painted one of three colors: 
// red, blue, or green. The cost of painting each house with a certain color is different. 
// You have to paint all the houses such that no two adjacent houses have the same color.
// Return the minimum cost to paint all houses.

// Time: O(n), Space: O(1)
func minCost(_ costs: [[Int]]) -> Int {
    var tab = [0, 0, 0]

    for i in 0..<costs.count {
        var red = costs[i][0] + min(tab[1], tab[2])
        var blue = costs[i][1] + min(tab[0], tab[2])
        var green = costs[i][2] + min(tab[0], tab[1])

        tab = [red, blue, green]
    }

    return tab.min() ?? 0
}


print(minCost([[17,2,17],[16,16,5],[14,3,19]]))
print(minCost([[7,6,2]]))

func minCost2(_ costs: [[Int]]) -> Int {
    var tab = Array(repeating: [0, 0, 0], count: costs.count + 1)

    for i in 0..<costs.count {
        tab[i + 1][0] = min(tab[i][1], tab[i][2]) + costs[i][0]
        tab[i + 1][1] = min(tab[i][0], tab[i][2]) + costs[i][1]
        tab[i + 1][2] = min(tab[i][0], tab[i][1]) + costs[i][2]
    }

    return tab[tab.count - 1].min() ?? 0
}

func minCost3(_ costs: [[Int]]) -> Int {
    var memo = [String: Int]()

    func dp(_ i: Int, _ previous: Int) -> Int {
        let key = "\(i),\(previous)"

        if i >= costs.count { return 0 }
        if let value = memo[key] { return value }

        var result = Int.max

        if previous != 0 { result = min(result, dp(i + 1, 0) + costs[i][0]) }
        if previous != 1 { result = min(result, dp(i + 1, 1) + costs[i][1]) }
        if previous != 2 { result = min(result, dp(i + 1, 2) + costs[i][2]) }

        memo[key] = result
        return result
    }

    return dp(0, -1)
}