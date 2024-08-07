// Given a data stream input of non-negative integers a1, a2, ..., an,
// summarize the numbers seen so far as a list of disjoint intervals.
// Implement the SummaryRanges class:
// SummaryRanges() Initializes the object with an empty stream.
// void addNum(int value) Adds the integer value to the stream.
// int[][] getIntervals() Returns a summary of the integers 
// in the stream currently as a list of disjoint intervals [starti, endi]. 
// The answer should be sorted by starti.

class SummaryRanges {

    private var intervals: [[Int]]

    init() {
        self.intervals = []
    }

    func addNum(_ value: Int) {
        var newInterval = [value, value]
        var i = 0

        while i < intervals.count {
            if intervals[i][1] + 1 < value {
                i += 1
            } else if intervals[i][0] - 1 > value {
                break
            } else {
                newInterval[0] = min(newInterval[0], intervals[i][0])
                newInterval[1] = max(newInterval[1], intervals[i][1])
                intervals.remove(at: i)
            }
        }
        
        intervals.insert(newInterval, at: i)
    }

    func getIntervals() -> [[Int]] {
        return intervals
    }
}