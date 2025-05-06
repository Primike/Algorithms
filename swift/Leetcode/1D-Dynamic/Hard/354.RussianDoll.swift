func maxEnvelopes(_ envelopes: [[Int]]) -> Int {
    guard !envelopes.isEmpty else { return 0 }

    var mutableEnvelopes = envelopes

    mutableEnvelopes.sort { a, b in
        if a[0] != b[0] {
            return a[0] < b[0]
        } else {
            return a[1] > b[1]
        }
    }

    let heights = mutableEnvelopes.map { $0[1] }

    var dp: [Int] = []
    for height in heights {
        var low = 0
        var high = dp.count
        while low < high {
            let mid = low + (high - low) / 2
            if dp[mid] < height {
                low = mid + 1
            } else {
                high = mid
            }
        }
        let insertionPoint = low

        if insertionPoint == dp.count {
            dp.append(height)
        } else {
            dp[insertionPoint] = height
        }
    }
    return dp.count
}