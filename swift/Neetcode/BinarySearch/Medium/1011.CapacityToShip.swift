// A conveyor belt has packages that must be shipped from 
// one port to another within days days.
// Return the least weight capacity of the ship that will result in 
// all the packages on the conveyor belt being shipped within days days.

func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
    var left = weights.max() ?? 0, right = weights.reduce(0, +)

    while left < right {
        let mid = (right + left) / 2
        var current = 0, count = 1

        for weight in weights {
            current += weight

            if current > mid {
                current = weight
                count += 1
            }
        }

        if count <= days {
            right = mid 
        } else {
            left = mid + 1
        }
    }

    return right
}

print(shipWithinDays([1,2,3,4,5,6,7,8,9,10], 5))
print(shipWithinDays([3,2,2,4,1,4], 3))
print(shipWithinDays([1,2,3,1,1], 4))