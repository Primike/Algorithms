func countMaxOrSubsets(_ nums: [Int]) -> Int {
    var maxOrValue = 0

    for num in nums {
        maxOrValue |= num
    }

    let totalSubsets = 1 << nums.count
    var result = 0

    for subsetMask in 0..<totalSubsets {
        var currentOrValue = 0

        for i in 0..<nums.count {
            if (subsetMask >> i) & 1 == 1 { currentOrValue |= nums[i] }
        }
        
        if currentOrValue == maxOrValue { result += 1 }
    }

    return result
}