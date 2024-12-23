// You are given an integer array banned and two integers n and maxSum. 
// You are choosing some number of integers following the below rules:
// The chosen integers have to be in the range [1, n].
// Each integer can be chosen at most once.
// The chosen integers should not be in the array banned.
// The sum of the chosen integers should not exceed maxSum.
// Return the maximum number of integers you can choose 
// following the mentioned rules.

func maxCount(_ banned: [Int], _ n: Int, _ maxSum: Int) -> Int {
    var banned = Set(banned)
    var result = 0
    var sum = 0

    for i in 1...n {
        if banned.contains(i) { continue }
        sum += i
        
        if sum > maxSum { return result }
        result += 1
    }

    return result
}

print(maxCount([1,6,5], 5, 6))
print(maxCount([1,2,3,4,5,6,7], 8, 1))
print(maxCount([11], 7, 50))