// Given an integer array nums, return the number of longest increasing subsequences.

func findNumberOfLIS(_ nums: [Int]) -> Int {
    if nums.count == 0 { return 0 }

    var lengths = Array(repeating: 1, count: nums.count)
    var counts = Array(repeating: 1, count: nums.count)

    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[i] > nums[j] {
                if lengths[j] + 1 > lengths[i] {
                    lengths[i] = lengths[j] + 1
                    counts[i] = counts[j]
                } else if lengths[j] + 1 == lengths[i] {
                    counts[i] += counts[j]
                }
            }
        }
    }

    let maxLength = lengths.max() ?? 0
    return zip(lengths, counts).filter { $0.0 == maxLength }.reduce(0) { $0 + $1.1 }
}
