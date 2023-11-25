// There is a row of n houses, where each house can be painted one of three colors: 
// red, blue, or green. The cost of painting each house with a certain color is different. 
// You have to paint all the houses such that no two adjacent houses have the same color.
// Return the minimum cost to paint all houses.

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
    var memo = [String: Int]()

    func dp(_ index: Int, _ color: Int) -> Int {
        let key = "\(index),\(color)"

        if index >= costs.count { return 0 }
        if let value = memo[key] { return value }

        var result = Int.max

        for i in 0..<3 {
            if i == color { continue }

            result = min(result, dp(index + 1, i) + costs[index][i])
        }

        memo[key] = result
        return result
    }
    
    return dp(0, -1)
}