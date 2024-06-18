// You have n jobs and m workers. You are given three arrays: 
// difficulty, profit, and worker where:
// difficulty[i] and profit[i] are the difficulty and 
// the profit of the ith job, and
// worker[j] is the ability of jth worker 
// Every worker can be assigned at most one job, 
// but one job can be completed multiple times.
// Return the maximum profit we can achieve after 
// assigning the workers to the jobs.

// Time: O(n * log(n)), Space: O(n)
func maxProfitAssignment(_ difficulty: [Int], _ profit: [Int], _ worker: [Int]) -> Int {
    let worker = worker.sorted()
    var jobs = [(Int, Int)]()

    for i in 0..<difficulty.count {
        jobs.append((difficulty[i], profit[i]))
    }

    jobs.sort { ($0.0, $0.1) < ($1.0, $1.1) }
    var result = 0
    var largest = jobs[0].1
    var i = 0

    for skill in worker {
        while i < jobs.count - 1, jobs[i + 1].0 <= skill {
            i += 1 
            largest = max(largest, jobs[i].1)
        }

        if jobs[i].0 <= skill { result += largest }
    }

    return result
}

print(maxProfitAssignment([2,4,6,8,10], [10,20,30,40,50], [4,5,6,7]))
print(maxProfitAssignment([85,47,57], [24,66,99], [40,25,25]))