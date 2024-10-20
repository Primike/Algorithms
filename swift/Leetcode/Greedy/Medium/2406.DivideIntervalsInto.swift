func minGroups(_ intervals: [[Int]]) -> Int {
    var events = [(Int, Int)]()

    for interval in intervals {
        events.append((interval[0], 1))
        events.append((interval[1] + 1, -1))
    }

    events.sort { $0.0 < $1.0 || ($0.0 == $1.0 && $0.1 < $1.1) }

    var concurrentIntervals = 0
    var result = 0

    for event in events {
        concurrentIntervals += event.1
        result = max(result, concurrentIntervals)
    }

    return result
}