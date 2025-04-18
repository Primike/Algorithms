func minOperations(_ grid: [[Int]], _ x: Int) -> Int {
    var nums = [Int]()
    for row in grid {
        for num in row {
            nums.append(num)
        }
    }
    nums.sort()
    let median = nums[nums.count / 2]
    var result = 0
    for num in nums {
        if num % x != median % x { return -1 }
        result += abs(median - num) / x
    }
    return result
}