// Return the minimum maximum difference among all p pairs. 
// We define the maximum of an empty set to be zero.

func minimizeMax(_ nums: [Int], _ p: Int) -> Int {
    if p == 0 { return 0 }
    
    var nums = nums.sorted()

    func checkDifference(_ guess: Int) -> Bool {
        var i = 0, count = 0

        while i < nums.count - 1 {
            if nums[i + 1] - nums[i] <= guess {
                count += 1
                i += 2
            } else {
                i += 1
            }

            if count == p { return true }
        }

        return false
    }

    var left = 0, right = nums[nums.count - 1] - nums[0]
    
    while left < right {
        let mid = (right + left) / 2

        if checkDifference(mid) {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return left
}

print(minimizeMax([10,1,2,7,1,3], 2))
print(minimizeMax([4,2,1,2], 1))