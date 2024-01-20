// Given an array of distinct integers nums and a target integer target, 
// return the number of possible combinations that add up to target.

// Time: O(target * n), Space: O(target)
func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
    var tab = Array(repeating: 0, count: target + 1)
    tab[0] = 1

    for i in 0..<target {
        if tab[i] == 0 { continue }

        for number in nums {
            if i + number < tab.count {
                if tab[i] > Int.max - tab[i + number] { continue }

                tab[i + number] += tab[i]
            }
        }
    }

    return tab[tab.count - 1]
}

print(combinationSum4([1,2,3], 4))
print(combinationSum4([9], 3))


func combinationSum4(_ nums: [Int], _ target: Int) -> Int {
    var memo = [Int: Int]()

    func dp(_ target: Int) -> Int {
        if target == 0 { return 1 }
        if target < 0 { return 0 }
        if let value = memo[target] { return value }

        var result = 0

        for i in 0..<nums.count {
            result += dp(target - nums[i])
        }

        memo[target] = result
        return result
    }

    return dp(target)
}