// In each turn, when you select a child, the happiness value of 
// all the children that have not been selected till now decreases by 1. 
// Note that the happiness value cannot become negative and 
// gets decremented only if it is positive.
// Return the maximum sum of the happiness values of the 
// selected children you can achieve by selecting k children.

// Time: O(n * logn), Space: O(1)
func maximumHappinessSum(_ happiness: [Int], _ k: Int) -> Int {
    let happiness = happiness.sorted { $0 > $1 }
    var result = 0

    for i in 0..<k {
        result += max(0, happiness[i] - i)
    }

    return result
}

print(maximumHappinessSum([1,2,3], 2))
print(maximumHappinessSum([1,1,1,1], 2))
print(maximumHappinessSum([2,3,4,5], 1))