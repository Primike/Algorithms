// You are given an integer array bloomDay, an integer m and an integer k.
// You want to make m bouquets. To make a bouquet, you need to use k 
// adjacent flowers from the garden.
// The garden consists of n flowers, the ith flower will bloom in the bloomDay[i] 
// and then can be used in exactly one bouquet.
// Return the minimum number of days you need to wait to be able to make 
// m bouquets from the garden. If it is impossible to make m bouquets return -1.

// Time: O(n * log(n)), Space: O(n)
func minDays(_ bloomDay: [Int], _ m: Int, _ k: Int) -> Int {
    if bloomDay.count < m * k { return -1 }

    func checkIfValid(_ days: Int) -> Bool {
        var streak = 0
        var maximum = 0
        var count = 0

        for i in 0..<bloomDay.count {
            streak += 1
            maximum = max(maximum, bloomDay[i])

            if streak == k, maximum <= days { 
                streak = 0
                maximum = 0
                count += 1
            } else if maximum > days {
                streak = 0
                maximum = 0
            }
        }

        return count >= m
    }

    var left = 1, right = bloomDay.max() ?? 1

    while left < right {
        let mid = (right + left) / 2

        if checkIfValid(mid) {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return left


}

print(minDays([1,10,3,10,2], 3, 1))
print(minDays([1,10,3,10,2], 3, 2))
print(minDays([7,7,7,7,12,7,7], 2, 3))