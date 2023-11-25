// Return the smallest possible weight of the left stone. 
// If there are no stones left, return 0.

func lastStoneWeightII(_ stones: [Int]) -> Int {
    let totalWeight = stones.reduce(0, +)
    let target = totalWeight / 2
    var tab = Array(repeating: false, count: target + 1)
    tab[0] = true

    for stone in stones {
        for j in stride(from: target, through: stone, by: -1) {
            tab[j] = tab[j] || tab[j - stone]
        }
    }

    for j in stride(from: target, through: 0, by: -1) {
        if tab[j] { return totalWeight - 2 * j }
    }

    return 0
}


print(lastStoneWeightII([2,7,4,1,8,1]))
print(lastStoneWeightII([31,26,33,21,40]))


func lastStoneWeightII2(_ stones: [Int]) -> Int {
    let total = stones.reduce(0, +)
    var memo = [String: Int]()

    func dp(_ index: Int, _ current: Int) -> Int {
        let key = "\(index),\(current)"

        if index == stones.count { return abs((total - current) - current) }
        if let value = memo[key] { return value }

        let include = dp(index + 1, current + stones[index])
        let exclude = dp(index + 1, current)
        let result = min(include, exclude)

        memo[key] = result
        return result
    }

    return dp(0, 0)
}