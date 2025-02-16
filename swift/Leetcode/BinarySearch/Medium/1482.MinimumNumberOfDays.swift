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

    var left = 0, right = bloomDay.max() ?? 0

    while left < right {
        let mid = (right + left) / 2
        var flowers = 0, bouquets = 0

        for day in bloomDay {
            if bouquets == m { break }

            if day <= mid {
                flowers += 1
            } else {
                flowers = 0
            }

            if flowers == k {
                flowers = 0
                bouquets += 1
            }
        }

        if bouquets >= m {
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