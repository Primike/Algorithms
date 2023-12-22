Return the maximum points you can earn for the exam.

func mostPoints(_ questions: [[Int]]) -> Int {
    var tab = [Int: Int]()

    for i in stride(from: questions.count - 1, to: -1, by: -1) {
        tab[i] = max(questions[i][0] + tab[i + 1 + questions[i][1], default: 0], tab[i + 1, default: 0])
    }

    return tab[0, default: 0]
}

print(mostPoints([[3,2],[4,3],[4,4],[2,5]]))
print(mostPoints([[1,1],[2,2],[3,3],[4,4],[5,5]]))


func mostPoints(_ questions: [[Int]]) -> Int {
    var memo = [Int: Int]()

    func dp(_ i: Int) -> Int {
        if i >= questions.count { return 0 }
        if let value = memo[i] { return value }

        var result = 0

        result = max(result, dp(i + 1))
        result = max(result, dp(i + questions[i][1] + 1) + questions[i][0])

        memo[i] = result
        return result
    }

    return dp(0)
}
