// We have n jobs, where every job is scheduled to be done from startTime[i] 
// to endTime[i], obtaining a profit of profit[i].
// You're given the startTime, endTime and profit arrays, 
// return the maximum profit you can take such that there are no two jobs 
// in the subset with overlapping time range.

// Time: O(n * logn), Space: O(n)
func jobScheduling(_ startTime: [Int], _ endTime: [Int], _ profit: [Int]) -> Int {
    var jobs = [(Int, Int, Int, Int)]()

    for i in 0..<startTime.count {
        jobs.append((startTime[i], endTime[i], profit[i], 0))
    }

    jobs.sort { $0.0 < $1.0 }

    func getIndex(_ i: Int) -> Int {
        let end = jobs[i].1
        var left = i + 1, right = jobs.count
        
        while left < right {
            let mid = (right + left) / 2

            if jobs[mid].0 >= end {
                right = mid
            } else {
                left = mid + 1
            }
        }

        return left
    }

    for i in 0..<jobs.count {
        jobs[i].3 = getIndex(i)
    }

    var memo = [Int: Int]()

    func dp(_ i: Int) -> Int {
        if i == startTime.count { return 0 }
        if let value = memo[i] { return value }

        let skip = dp(i + 1), take = dp(jobs[i].3) + jobs[i].2
        let result = max(skip, take)

        memo[i] = result
        return result
    }

    return dp(0)
}

print(jobScheduling([1,2,3,3], [3,4,5,6], [50,10,40,70]))
print(jobScheduling([1,2,3,4,6], [3,5,10,6,9], [20,20,100,70,60]))
print(jobScheduling([1,1,1], [2,3,4], [5,6,4]))