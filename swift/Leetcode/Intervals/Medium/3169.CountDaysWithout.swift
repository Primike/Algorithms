// You are given a positive integer days representing 
// the total number of days an employee is available for work (starting from day 1). 
// You are also given a 2D array meetings of size n where, 
// meetings[i] = [start_i, end_i] represents the starting and 
// ending days of meeting i (inclusive).
// Return the count of days when the employee is available 
// for work but no meetings are scheduled.
// Note: The meetings may overlap.

// Time: O(n * log(n)), Space: O(n)
func countDays(_ days: Int, _ meetings: [[Int]]) -> Int {
    let meetings = meetings.sorted { ($0[0], -$0[1]) < ($1[0], -$1[1]) }
    var result = 0
    var last = 0
    var i = 0

    while i < meetings.count {
        var current = meetings[i]
        result += max(0, current[0] - last - 1)

        while i < meetings.count, current[1] >= meetings[i][0] {
            current[1] = max(current[1], meetings[i][1])
            i += 1
        }

        last = current[1]
    }

    result += max(0, days - last)
    return result
}

print(countDays(10, [[5,7],[1,3],[9,10]]))
print(countDays(5, [[2,4],[1,3]]))
print(countDays(6, [[1,6]]))