class SummaryRanges {

    var ranges: [[Int]]

    init() {
        self.ranges = []
    }

    func addNum(_ value: Int) {
        if ranges.isEmpty {
            ranges.append([value, value])
            return
        }

        var left = 0, right = ranges.count - 1

        while left <= right {
            let mid = left + (right - left) / 2

            if ranges[mid][0] <= value, ranges[mid][1] >= value { 
                return 
            } else if ranges[mid][1] < value {
                left = mid + 1
            } else {
                right = mid - 1
            }
        }

        if left > 0, ranges[left - 1][1] + 1 >= value {
            ranges[left - 1][1] = max(ranges[left - 1][1], value)

            if left < ranges.count, ranges[left][0] - 1 <= value {
                ranges[left - 1][1] = max(ranges[left - 1][1], ranges[left][1])
                ranges.remove(at: left)
            }
        } else if left < ranges.count, ranges[left][0] - 1 <= value {
            ranges[left][0] = min(ranges[left][0], value)
        } else {
            ranges.insert([value, value], at: left)
        }
    }

    func getIntervals() -> [[Int]] {
        return ranges
    }
}