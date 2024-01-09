// We are given a list schedule of employees, 
// which represents the working time for each employee.
// Each employee has a list of non-overlapping Intervals, 
// and these intervals are in sorted order.
// Return the list of finite intervals representing common, 
// positive-length free time for all employees, also in sorted order.

func employeeFreeTime(_ schedule: [[Interval]]) -> [Interval] {
    var intervals = [(Int, Int)]()

    for array in schedule {
        for interval in array {
            intervals.append((interval.start, interval.end))
        }
    }

    intervals.sort { ($0.0, -$0.1) < ($1.0, -$1.1)}
    var newIntervals = [(Int, Int)]()
    var i = 0

    while i < intervals.count {
        var current = intervals[i]

        while i < intervals.count, current.1 >= intervals[i].0 {
            current = (current.0, max(current.1, intervals[i].1))
            i += 1
        }

        newIntervals.append(current)
    }

    var result = [Interval]()
    i = 0

    while i < newIntervals.count - 1 {
        if newIntervals[i].1 + 1 <= newIntervals[i + 1].0 {
            result.append(Interval(newIntervals[i].1, newIntervals[i + 1].0))
        }

        i += 1
    }

    return result
}