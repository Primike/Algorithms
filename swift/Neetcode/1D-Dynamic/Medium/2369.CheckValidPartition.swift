// Return true if the array has at least one valid partition. Otherwise, return false.

func validPartition(_ nums: [Int]) -> Bool {
    var tab = Array(repeating: false, count: nums.count + 1)
    tab[0] = true

    for i in 0..<(nums.count - 1) {
        if tab[i] == false { continue }

        if nums[i] == nums[i + 1] { tab[i + 2] = true }

        if i + 2 < nums.count {
            if nums[i] == nums[i + 1], nums[i + 1] == nums[i + 2] {
                tab[i + 3] = true
            }

            if nums[i] + 1 == nums[i + 1], nums[i + 1] + 1 == nums[i + 2] {
                tab[i + 3] = true
            }
        }
    }

    return tab[tab.count - 1]
}

print(validPartition([4,4,4,5,6]))
print(validPartition([1,1,1,2]))