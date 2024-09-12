

func missingRolls(_ rolls: [Int], _ mean: Int, _ n: Int) -> [Int] {
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

print(missingRolls([3,2,4,3], 4, 2))
print(missingRolls([1,5,6], 3, 4))
print(missingRolls([1,2,3,4], 6, 4))