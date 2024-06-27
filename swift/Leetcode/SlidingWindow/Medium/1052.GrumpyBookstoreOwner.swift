// On some minutes, the bookstore owner is grumpy. 
// You are given a binary array grumpy where grumpy[i] is 1 if the 
// bookstore owner is grumpy during the ith minute, and is 0 otherwise.
// When the bookstore owner is grumpy, 
// the customers of that minute are not satisfied, otherwise, they are satisfied.
// The bookstore owner knows a secret technique to keep themselves not grumpy 
// for minutes consecutive minutes, but can only use it once.
// Return the maximum number of customers that can be satisfied throughout the day.

// Time: O(n), Space: O(1)
func maxSatisfied(_ customers: [Int], _ grumpy: [Int], _ minutes: Int) -> Int {
    var total = 0

    for i in 0..<grumpy.count {
        if grumpy[i] == 0 { total += customers[i] }
        if i < minutes, grumpy[i] == 1 { total += customers[i] } 
    }

    var result = total

    for i in minutes..<grumpy.count {
        if grumpy[i] == 1 { total += customers[i] }
        if grumpy[i - minutes] == 1 { total -= customers[i - minutes] }
        result = max(result, total)
    }

    return result
}

print(maxSatisfied([1,0,1,2,1,1,7,5], [0,1,0,1,0,1,0,1], 3))
print(maxSatisfied([1], [0], 1))