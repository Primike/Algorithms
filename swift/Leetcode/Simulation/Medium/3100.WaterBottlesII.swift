class Solution {
    func maxBottlesDrunk(_ numBottles: Int, _ numExchange: Int) -> Int {
        var totalDrunk = numBottles
        var emptyBottles = numBottles
        var currentExchangeCost = numExchange

        while emptyBottles >= currentExchangeCost {
            emptyBottles -= currentExchangeCost
            
            totalDrunk += 1
            emptyBottles += 1
            
            currentExchangeCost += 1
        }
        
        return totalDrunk
    }
}