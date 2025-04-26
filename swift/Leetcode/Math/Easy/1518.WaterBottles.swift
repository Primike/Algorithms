// There are numBottles water bottles that are initially full of water. 
// You can exchange numExchange empty water bottles 
// from the market with one full water bottle.
// The operation of drinking a full water bottle turns it into an empty bottle.
// Given the two integers numBottles and numExchange, 
// return the maximum number of water bottles you can drink.

// Time: O(log_m(n)), Space: O(1)
func numWaterBottles(_ numBottles: Int, _ numExchange: Int) -> Int {
    var result = 0
    var filled = numBottles

    while filled >= numExchange {
        let refills = filled / numExchange
        let remainder = filled % numExchange
        result += filled - remainder
        filled = refills + remainder
    }

    return result + filled
}

print(numWaterBottles(9, 3))
print(numWaterBottles(15, 4))