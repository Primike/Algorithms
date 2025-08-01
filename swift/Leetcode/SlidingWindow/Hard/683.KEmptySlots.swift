// You have n bulbs in a row numbered from 1 to n. Initially, 
// all the bulbs are turned off. We turn on exactly one bulb every day 
// until all bulbs are on after n days.
// You are given an array bulbs of length n where bulbs[i] = x 
// means that on the (i+1)th day, we will turn on the bulb at 
// position x where i is 0-indexed and x is 1-indexed.
// Given an integer k, return the minimum day number such that 
// there exists two turned on bulbs that have exactly k bulbs 
// between them that are all turned off. If there isn't such day, return -1.

// Time: O(n), Space: O(n)
func kEmptySlots(_ flowers: [Int], _ k: Int) -> Int {
    var days = Array(repeating: 0, count: flowers.count)

    for right in 0..<flowers.count {
        days[flowers[right] - 1] = right + 1
    }

    var result = Int.max
    var left = 0, right = k + 1

    while right < days.count {
        let day1 = days[left]
        let day2 = days[right]
        var isValid = true

        for i in (left + 1)..<right {
            if days[i] < day1 || days[i] < day2 {
                left = i
                right = i + k + 1
                isValid = false
                break
            }
        }
        
        if isValid {
            result = min(result, max(day1, day2))
            left = right
            right = left + k + 1
        }
    }

    return result == Int.max ? -1 : result
}

print(kEmptySlots([1,3,2], 1))
print(kEmptySlots([1,2,3], 1))