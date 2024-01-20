// Return the maximum number of points you can earn by applying 
// the above operation some number of times.

// Time: O(n), Space: O(n)
func deleteAndEarn(_ nums: [Int]) -> Int {
    var dict = nums.reduce(into: [:]) { $0[$1, default: 0] += $1 }
    let limit = (nums.max() ?? 0) + 1
    var tab = Array(repeating: 0, count: limit)
    tab[0] = 0
    tab[1] = dict[1, default: 0]

    for i in 2..<limit {
        tab[i] = max(tab[i - 2] + dict[i, default: 0], tab[i - 1])
    }

    return tab[limit - 1]
}

print(deleteAndEarn([3,4,2]))
print(deleteAndEarn([2,2,3,3,3,4]))


func deleteAndEarn2(_ nums: [Int]) -> Int {
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