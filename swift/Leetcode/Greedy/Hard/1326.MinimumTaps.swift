// There is a one-dimensional garden on the x-axis. The garden starts at 
// the point 0 and ends at the point n. (i.e., the length of the garden is n).
// There are n + 1 taps located at points [0, 1, ..., n] in the garden.
// Given an integer n and an integer array ranges of length n + 1 
// where ranges[i] (0-indexed) means the i-th tap can water the area 
// [i - ranges[i], i + ranges[i]] if it was open.
// Return the minimum number of taps that should be open 
// to water the whole garden, If the garden cannot be watered return -1.

// Time: O(n * log(n)), Space: O(n)
func minTaps(_ n: Int, _ ranges: [Int]) -> Int {
    var intervals = [[Int]]()

    for (i, range) in ranges.enumerated() {
        intervals.append([max(0, i - range), i + range])
    }

    intervals.sort { ($0[0], -$0[1]) < ($1[0], -$1[1]) }
    
    if intervals[0][0] > 0 { return -1 }

    var result = 1
    var farthest = intervals[0][1]
    var current = intervals[0][1]

    for i in 1..<intervals.count {
        if farthest < intervals[i][0] { return -1 }
        if current > n { return result }
        if current < intervals[i][0] {
            current = farthest
            result += 1
        }

        farthest = max(farthest, intervals[i][1])
    }

    if current < n { 
        current = farthest 
        result += 1
    }

    return current >= n ? result : -1
}

print(minTaps(5, [3,4,1,1,0,0]))
print(minTaps(3, [0,0,0,0]))


func minTaps2(_ n: Int, _ ranges: [Int]) -> Int {
    var intervals = [(Int, Int)]()

    for (i, range) in ranges.enumerated() {
        intervals.append((max(0, i - range), min(n, i + range)))
    }

    intervals.sort { $0.0 < $1.0 }

    var result = 0
    var maxReach = 0
    var i = 0

    while i < intervals.count, maxReach < n {
        var reach = maxReach

        while i < intervals.count, intervals[i].0 <= maxReach {
            reach = max(reach, intervals[i].1)
            i += 1
        }

        if reach == maxReach { return -1 }

        result += 1
        maxReach = reach
    }

    return maxReach >= n ? result : -1
}