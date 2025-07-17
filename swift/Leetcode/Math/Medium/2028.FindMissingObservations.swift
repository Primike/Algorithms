// You have observations of n + m 6-sided dice rolls with 
// each face numbered from 1 to 6. n of the observations went missing, 
// and you only have the observations of m rolls. Fortunately, 
// you have also calculated the average value of the n + m rolls.
// You are given an integer array rolls of length m where rolls[i] 
// is the value of the ith observation. You are also given the two integers mean and n.
// Return an array of length n containing the missing observations 
// such that the average value of the n + m rolls is exactly mean. 
// If there are multiple valid answers, return any of them. 
// If no such array exists, return an empty array.

// Time: O(n), Space: O(n)
func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
    let total = rolls.reduce(0, +)
    var target = mean * (rolls.count + n) - total
    var result = [Int]()
    var current = 6

    for i in 0..<n {
        if current <= 0 { break }

        while current + n - 1 - i > target {
            current -= 1
        }

        target -= current
        result.append(current)
    }

    if target != 0 || result.count != n { return [] }
    return result
}

print(missingRolls([3,2,4,3], 4, 2))
print(missingRolls([1,5,6], 3, 4))
print(missingRolls([1,2,3,4], 6, 4))


func missingRolls2(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
    let sumRolls = rolls.reduce(0, +)
    let remainingSum = mean * (n + rolls.count) - sumRolls

    if remainingSum > 6 * n || remainingSum < n { return [] }

    let distributeMean = remainingSum / n
    let mod = remainingSum % n
    var result = Array(repeating: distributeMean, count: n)

    for i in 0..<mod {
        result[i] += 1
    }

    return result
}