
func lenLongestFibSubseq(_ arr: [Int]) -> Int {
    let n = arr.count
    var maxLen = 0
    var dp = Array(repeating: Array(repeating: 0, count: n), count: n)
    var valToIdx = [Int: Int]()
    for (i, num) in arr.enumerated() {
        valToIdx[num] = i
    }
    for curr in 0..<n {
        for prev in 0..<curr {
            let diff = arr[curr] - arr[prev]
            if let prevIdx = valToIdx[diff], diff < arr[prev] {
                dp[prev][curr] = dp[prevIdx][prev] + 1
            } else {
                dp[prev][curr] = 2
            }
            maxLen = max(maxLen, dp[prev][curr])
        }
    }
    return maxLen > 2 ? maxLen : 0
}