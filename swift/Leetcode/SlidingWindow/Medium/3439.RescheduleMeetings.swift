// You are given an integer eventTime denoting the duration of an event, 
// where the event occurs from time t = 0 to time t = eventTime.
// You are also given two integer arrays startTime and endTime, 
// each of length n. These represent the start and end time of 
// n non-overlapping meetings, where the ith meeting occurs during 
// the time [startTime[i], endTime[i]].
// You can reschedule at most k meetings by moving their start time 
// while maintaining the same duration, to maximize the longest 
// continuous period of free time during the event.
// The relative order of all the meetings should stay the same and 
// they should remain non-overlapping.
// Return the maximum amount of free time possible after rearranging the meetings.

// Time: O(n), Space: O(1)
func maxFreeTime(_ eventTime: Int, _ k: Int, _ startTime: [Int], _ endTime: [Int]) -> Int {
    var result = 0
    var time = 0

    for i in 0..<startTime.count {
        time += endTime[i] - startTime[i]
        if i < k - 1 { continue }

        var left = i - k < 0 ? 0 : endTime[i - k]
        var right = i == startTime.count - 1 ? eventTime : startTime[i + 1]
        result = max(result, right - left - time)
        
        if i >= k - 1 { time -= endTime[i - k + 1] - startTime[i - k + 1] }
    }

    return result
}

print(maxFreeTime(5, 1, [1,3], [2,5]))
print(maxFreeTime(10, 1, [0,2,9], [1,4,10]))
print(maxFreeTime(5, 2, [0,1,2,3,4], [1,2,3,4,5]))