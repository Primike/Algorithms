// We have n jobs, where every job is scheduled to be done from startTime[i] 
// to endTime[i], obtaining a profit of profit[i].
// You're given the startTime, endTime and profit arrays, 
// return the maximum profit you can take such that there are no two jobs 
// in the subset with overlapping time range.

// Time: O(n * logn), Space: O(n)
func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
    var jobs = [(Int, Int, Int)]()

    for i in 0..<startTime.count {
        jobs.append((startTime[i], endTime[i], profit[i]))
    }

    jobs.sort { $0.0 < $1.0 }
    var tab = Array(repeating: 0, count: jobs.count + 1)

    for i in (0..<jobs.count).reversed() {
        var left = i, right = jobs.count - 1

        while left <= right {
            let mid = (right + left) / 2

            if jobs[mid].0 >= jobs[i].1 {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        tab[i] = max(tab[i + 1], tab[left] + jobs[i].2)
    }

    return tab[0]
}

print(jobScheduling([1,2,3,3], [3,4,5,6], [50,10,40,70]))
print(jobScheduling([1,2,3,4,6], [3,5,10,6,9], [20,20,100,70,60]))
print(jobScheduling([1,1,1], [2,3,4], [5,6,4]))


func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
    var jobs = [(Int, Int, Int)]()

    for i in 0..<startTime.count {
        jobs.append((startTime[i], endTime[i], profit[i]))
    }

    jobs.sort { $0.0 < $1.0 }
    var memo = [Int: Int]()

    func dp(_ i: Int) -> Int {
        if i == jobs.count { return 0 }
        if let value = memo[i] { return value }

        var result = dp(i + 1)
        var left = i, right = jobs.count - 1

        while left <= right {
            let mid = (right + left) / 2

            if jobs[mid].0 >= jobs[i].1 {
                right = mid - 1
            } else {
                left = mid + 1
            }
        }

        result = max(result, dp(left) + jobs[i].2)
        memo[i] = result
        return result
    }

    return dp(0)
}