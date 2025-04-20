// We are given a list schedule of employees, 
// which represents the working time for each employee.
// Each employee has a list of non-overlapping Intervals, 
// and these intervals are in sorted order.
// Return the list of finite intervals representing common, 
// positive-length free time for all employees, also in sorted order.

public class Interval {
    public var start: Int
    public var end: Int
    public init(_ start: Int, _ end: Int) {
        self.start = start
        self.end = end
    }
}

// Time: O(n * log(n)), Space: O(n)
func employeeFreeTime(_ schedule: [[Interval]]) -> [Interval] {
    var schedule = schedule.flatMap { $0 }.sorted { $0.start < $1.start }
    var result = [Interval]()
    var last = schedule[0].start
    var i = 0

    while i < schedule.count {
        if last < schedule[i].start { result.append(Interval(last, schedule[i].start)) }
        
        var current = schedule[i].end

        while i < schedule.count, current >= schedule[i].start {
            current = max(current, schedule[i].end)
            i += 1
        }

        last = current
    }

    return result
}