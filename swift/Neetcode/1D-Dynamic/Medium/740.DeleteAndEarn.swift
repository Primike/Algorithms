// Return the maximum number of points you can earn by applying 
// the above operation some number of times.

// Time: O(n), Space: O(n)
func deleteAndEarn(_ nums: [Int]) -> Int {
    let dict = nums.reduce(into: [:]) { $0[$1, default: 0] += $1 }
    let maximum = nums.max() ?? 0
    var oneBack = 0, twoBack = 0

    for i in 1...maximum {
        let current = dict[i, default: 0] + twoBack
        twoBack = oneBack
        oneBack = max(oneBack, current)
    }

    return oneBack
}

print(deleteAndEarn([3,4,2]))
print(deleteAndEarn([2,2,3,3,3,4]))


func deleteAndEarn2(_ nums: [Int]) -> Int {
    let dict = nums.reduce(into: [:]) { $0[$1, default: 0] += $1 }
    let maximum = nums.max() ?? 0
    var tab = Array(repeating: 0, count: maximum + 1)

    for i in 0..<tab.count {
        tab[i] += dict[i, default: 0]

        if i >= 2 { tab[i] += tab[i - 2] }
        if i >= 1 { tab[i] = max(tab[i], tab[i - 1]) }
    }

    return tab[maximum]
}

func deleteAndEarn3(_ nums: [Int]) -> Int {
    let maximum = nums.max() ?? 0
    let dict = nums.reduce(into: [:]) { $0[$1, default: 0] += $1 }
    var memo = [Int: Int]()

    func dp(_ i: Int) -> Int {
        if i <= 0 { return 0 }
        if let value = memo[i] { return value }

        let result = max(dict[i, default: 0] + dp(i - 2), dp(i - 1))
        memo[i] = result
        return result
    }

    return dp(maximum)
}

func deleteAndEarn4(_ nums: [Int]) -> Int {
    let nums = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var numbers = [(Int, Int)]()

    for (key, value) in nums {
        numbers.append((key, value))
    }

    numbers.sort { ($0.0 < $1.0) }
    var memo = [Int: Int]()

    func dp(_ i: Int) -> Int {
        if i == numbers.count { return 0 }
        if let value = memo[i] { return value }

        var result = dp(i + 1)
        var j = 1

        if i < numbers.count - 1, numbers[i + 1].0 - 1 == numbers[i].0 { j += 1 }
        result = max(result, dp(i + j) + numbers[i].0 * numbers[i].1)

        memo[i] = result
        return result
    }

    return dp(0)
}