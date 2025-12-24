// A smooth descent period of a stock consists of one or more 
// contiguous days such that the price on each day is 
// lower than the price on the preceding day by exactly 1. 
// The first day of the period is exempted from this rule.
// Return the number of smooth descent periods.

// Time: O(n), Space: O(1)
func getDescentPeriods(_ prices: [Int]) -> Int {
    var result = prices.count
    var length = 1

    for i in 1..<prices.count {
        if prices[i] + 1 == prices[i - 1] {
            result += length
            length += 1
        } else {
            length = 1
        }
    }

    return result
}

print(getDescentPeriods([3,2,1,4]))
print(getDescentPeriods([8,6,7,7]))
print(getDescentPeriods([1]))