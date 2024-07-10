// Given an integer array nums, return true if you can partition the array into 
// two subsets such that the sum of the elements in both subsets is equal or false otherwise.

//enumerated caputres old array values so iteration doesnt have to be backwards

// Time: O(n * target), Space: O(target)
func canPartition(_ nums: [Int]) -> Bool {
    if nums.reduce(0, +) % 2 != 0 { return false }

    let target = nums.reduce(0, +) / 2
    var tab = Array(repeating: false, count: target + 1)
    tab[0] = true

    for number in nums {
        for (i, staticBool) in tab.enumerated() {
            if staticBool == false { continue }

            let index = i + number

            if index < tab.count { tab[index] = true }
        }
    }

    return tab[target]
}

print(canPartition([1,5,11,5]))
print(canPartition([1,2,3,5]))


func canPartition2(_ nums: [Int]) -> Bool {
    let sum = nums.reduce(0, +)

    if sum % 2 != 0 { return false }

    let target = sum / 2
    var tab = Array(repeating: false, count: target + 1)
    tab[0] = true

    for number in nums {
        for i in stride(from: target, through: number, by: -1) {
            if tab[i - number] { tab[i] = tab[i - number] }
        }
    }
    
    return tab[target]
}

func canPartition3(_ nums: [Int]) -> Bool {
    if nums.reduce(0, +) % 2 != 0 { return false }

    let target = nums.reduce(0, +) / 2
    var tab = Array(repeating: false, count: target + 1)
    tab[0] = true

    for i in 0..<nums.count {
        var nextRow = Array(repeating: false, count: target + 1)
        let number = nums[i]

        for j in 0...target {
            nextRow[j] = tab[j] || (j >= number && tab[j - number])
        }

        tab = nextRow
    }

    return tab[target]
}

func canPartition4(_ nums: [Int]) -> Bool {
    if nums.reduce(0, +) % 2 != 0 { return false }

    let target = nums.reduce(0, +) / 2
    var tab = Array(repeating: Array(repeating: false, count: target + 1), count: nums.count + 1)
    tab[0][0] = true

    for i in 1...nums.count {
        let number = nums[i - 1]

        for j in 0...target {
            tab[i][j] = tab[i - 1][j] || (j >= number && tab[i - 1][j - number])
        }
    }

    return tab[nums.count][target]
}

func canPartition5(_ nums: [Int]) -> Bool {
    if nums.reduce(0, +) % 2 != 0 { return false }

    let target = nums.reduce(0, +) / 2
    var memo = [String: Bool]()

    func dp(_ i: Int, _ target: Int) -> Bool {
        let key = "\(i),\(target)"

        if target == 0 { return true }
        if target < 0 || i == nums.count { return false }
        if let value = memo[key] { return value }

        let result = dp(i + 1, target - nums[i]) || dp(i + 1, target)
        memo[key] = result
        return result
    }

    return dp(0, target)
}