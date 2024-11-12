func longestSquareStreak(_ nums: [Int]) -> Int {
    var streakLengths = [Int: Int]()
    let nums = nums.sorted()

    for number in nums {
        let root = Int(Double(number).squareRoot())

        if root * root == number, let streak = streakLengths[root] {
            streakLengths[number] = streak + 1
        } else {
            streakLengths[number] = 1
        }
    }

    let longestStreak = streakLengths.values.max() ?? 0
    return longestStreak > 1 ? longestStreak : -1
}