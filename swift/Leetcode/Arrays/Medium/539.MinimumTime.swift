// Given a list of 24-hour clock time points in "HH:MM" format, 
// return the minimum minutes difference between any two time-points in the list.

func findMinDifference(_ timePoints: [String]) -> Int {
    var times = timePoints.map { $0.split(separator: ":").compactMap { Int($0) } }.map { $0[0] * 60 + $0[1] }
    times.sort { $0 < $1 }
    var result = Int.max

    for i in 1..<times.count {
        result = min(result, times[i] - times[i - 1])
    }

    result = min(result, times[0] + 1440 - times[times.count - 1])
    return result
}

print(findMinDifference(["23:59","00:00"]))
print(findMinDifference(["00:00","23:59","00:00"]))