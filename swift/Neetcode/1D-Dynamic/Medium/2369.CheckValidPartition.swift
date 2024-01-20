// Return true if the array has at least one valid partition. Otherwise, return false.

// Time: O(n), Space: O(n)
func validPartition(_ nums: [Int]) -> Bool {
    var tab = Array(repeating: false, count: nums.count + 1)
    tab[0] = true

    for i in 0..<nums.count {
        if !tab[i] { continue }

        if i + 1 < nums.count {
            if nums[i] == nums[i + 1] { tab[i + 2] = true }
        }
        
        if i + 2 < nums.count {
            if nums[i] + 1 == nums[i + 1], nums[i + 1] + 1 == nums[i + 2] {
                tab[i + 3] = true
            } else if nums[i] == nums[i + 1], nums[i + 1] == nums[i + 2] {
                tab[i + 3] = true
            }
        }
    }

    return tab[tab.count - 1]
}

print(validPartition([4,4,4,5,6]))
print(validPartition([1,1,1,2]))


func validPartition2(_ nums: [Int]) -> Bool {
    var memo = [Int: Bool]()

    func dp(_ i: Int) -> Bool {
        if i >= nums.count { return true }
        if let value = memo[i] { return value }

        var result = false
        
        if i + 1 < nums.count {
            if nums[i] == nums[i + 1] { result = result || dp(i + 2) }
        }

        if i + 2 < nums.count {
            if nums[i] == nums[i + 1], nums[i] == nums[i + 2] {
                result = result || dp(i + 3)
            } else if nums[i] + 1 == nums[i + 1], nums[i] + 2 == nums[i + 2] {
                result = result || dp(i + 3)
            }
        }

        memo[i] = result
        return result
    }

    return dp(0)
}