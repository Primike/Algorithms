// You want to schedule a list of jobs in d days. Jobs are dependent 
// (i.e To work on the ith job, you have to finish all the jobs j where 0 <= j < i).
// You have to finish at least one task every day. 
// The difficulty of a job schedule is the sum of difficulties of each day of the d days. 
// The difficulty of a day is the maximum difficulty of a job done on that day.
// You are given an integer array jobDifficulty and an integer d. 
// The difficulty of the ith job is jobDifficulty[i].
// Return the minimum difficulty of a job schedule. 
// If you cannot find a schedule for the jobs return -1.

// Time: O(n^2 * d), Space: O(n * d)
func minDifficulty(_ jobDifficulty: [Int], _ d: Int) -> Int {
    if jobDifficulty.count < d { return -1 }

    let largest = jobDifficulty.reduce(0, +)
    var tab = Array(repeating: Array(repeating: largest, count: d + 1), count: jobDifficulty.count + 1)
    tab[jobDifficulty.count][0] = 0

    for i in (0..<jobDifficulty.count).reversed() {
        for j in 1...d {
            var maximum = 0

            for k in i..<jobDifficulty.count {
                maximum = max(maximum, jobDifficulty[k])
                tab[i][j] = min(tab[i][j], tab[k + 1][j - 1] + maximum)
            }
        }
    }

    return tab[0][d]
}

print(minDifficulty([6,5,4,3,2,1], 2))
print(minDifficulty([9,9,9], 4))
print(minDifficulty([1,1,1], 3))


func minDifficulty2(_ jobDifficulty: [Int], _ d: Int) -> Int {
    if jobDifficulty.count < d { return -1 }

    let largest = jobDifficulty.reduce(0, +)
    var memo = [String: Int]()

    func dp(_ index: Int, _ d: Int) -> Int {
        let key = "\(index),\(d)"

        if index == jobDifficulty.count, d == 0 { return 0 }
        if index == jobDifficulty.count || d == 0 { return largest }
        if let value = memo[key] { return value }

        var result = Int.max
        var maximum = 0

        for i in index..<jobDifficulty.count {
            maximum = max(maximum, jobDifficulty[i])
            result = min(result, dp(i + 1, d - 1) + maximum)
        }

        memo[key] = result
        return result
    }

    return dp(0, d)
}