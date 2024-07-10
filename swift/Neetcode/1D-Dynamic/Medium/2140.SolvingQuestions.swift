// Return the maximum points you can earn for the exam.

// Time: O(n), Space: O(n)
func mostPoints(_ questions: [[Int]]) -> Int {
    var tab = Array(repeating: 0, count: questions.count + 1)

    for i in (0..<questions.count).reversed() {
        let skip = tab[i + 1]
        let take = questions[i][0] + tab[min(i + questions[i][1] + 1, tab.count - 1)]

        tab[i] = max(skip, take)
    }

    return tab[0]
}

print(mostPoints([[3,2],[4,3],[4,4],[2,5]]))
print(mostPoints([[1,1],[2,2],[3,3],[4,4],[5,5]]))


func mostPoints2(_ questions: [[Int]]) -> Int {
    var memo = [Int: Int]()

    func dp(_ i: Int) -> Int {
        if i >= questions.count { return 0 }
        if let value = memo[i] { return value }

        let take = dp(i + questions[i][1] + 1) + questions[i][0]
        let skip = dp(i + 1)
        let result = max(take, skip)

        memo[i] = result
        return result
    }

    return dp(0)
}