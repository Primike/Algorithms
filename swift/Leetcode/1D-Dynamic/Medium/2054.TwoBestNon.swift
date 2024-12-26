func maxTwoEvents(_ events: [[Int]]) -> Int {
    let events = events.sorted { $0[0] < $1[0] }
    var memo = [String: Int]()

    func dp(_ i: Int, _ count: Int) -> Int {
        let key = "\(i),\(count)"
        
        if i == events.count || count == 2 { return 0 }
        if let value = memo[key] { return value }

        var result = dp(i + 1, count)
        var left = i + 1, right = events.count

        while left < right {
            let mid = (left + right) / 2

            if events[mid][0] > events[i][1] {
                right = mid
            } else {
                left = mid + 1
            }
        }

        result = max(result, dp(left, count + 1) + events[i][2])

        memo[key] = result
        return result
    }

    return dp(0, 0)
}

print(maxTwoEvents([[1,3,2],[4,5,2],[2,4,3]]))
print(maxTwoEvents([[1,3,2],[4,5,2],[1,5,5]]))
print(maxTwoEvents([[1,5,3],[1,5,1],[6,6,5]]))