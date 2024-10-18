func minSubarray(_ nums: [Int], _ p: Int) -> Int {
    var totalSum = 0

    for num in nums {
        totalSum = (totalSum + num) % p
    }

    let target = totalSum % p
    if target == 0 { return 0 }

    var prefixDict = [0: -1]
    var currentSum = 0
    var result = nums.count

    for i in 0..<nums.count {
        currentSum = (currentSum + nums[i]) % p
        let needed = (currentSum - target + p) % p

        if let index = prefixDict[needed] {
            result = min(result, i - index)
        }

        prefixDict[currentSum] = i
    }

    return result == nums.count ? -1 : result
}