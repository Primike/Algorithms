class Solution {
    func maxIceCream(_ costs: [Int], _ coins: Int) -> Int {
        var costs = costs
        costs.sort()
        
        let n = costs.count
        var icecream = 0
        var remainingCoins = coins
        
        while icecream < n && costs[icecream] <= remainingCoins {
            remainingCoins -= costs[icecream]
            icecream += 1
        }
        
        return icecream
    }
}