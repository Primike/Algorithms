// Hercy wants to save money for his first car. 
// He puts money in the Leetcode bank every day.
// He starts by putting in $1 on Monday, the first day. 
// Every day from Tuesday to Sunday, he will put in $1 more 
// than the day before. On every subsequent Monday, 
// he will put in $1 more than the previous Monday.
// Given n, return the total amount of money he will have 
// in the Leetcode bank at the end of the nth day.

// Time: O(1), Space: O(1)
func totalMoney(_ n: Int) -> Int {
    let weekSum = Array(1...7).reduce(0, +)
    let week = n / 7
    let daysLeft = n % 7   
    var result = 0

    for i in 0..<week {
        result += weekSum + (i * 7)
    }

    for i in 0..<daysLeft {
        result += (week + 1 + i)
    }

    return result
}

print(totalMoney(4))
print(totalMoney(10))
print(totalMoney(20))