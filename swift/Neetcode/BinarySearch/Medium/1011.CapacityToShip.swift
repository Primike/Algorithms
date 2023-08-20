// A conveyor belt has packages that must be shipped from 
// one port to another within days days.
// Return the least weight capacity of the ship that will result in 
// all the packages on the conveyor belt being shipped within days days.

func shipWithinDays(_ weights: [Int], _ days: Int) -> Int {
    var lower = weights.max() ?? 0, upper = weights.reduce(0, +)

    while lower <= upper {
        let mid = (upper + lower) / 2

        var currentWeight = 0
        var totalDays = 0

        for weight in weights {
            if currentWeight + weight > mid {
                totalDays += 1
                currentWeight = 0
            }

            currentWeight += weight
        }
        
        if currentWeight > 0 { totalDays += 1 }

        if totalDays > days {
            lower = mid + 1
        } else {
            upper = mid - 1
        }
    }

    return lower
}

print(shipWithinDays([1,2,3,4,5,6,7,8,9,10], 5))
print(shipWithinDays([3,2,2,4,1,4], 3))
print(shipWithinDays([1,2,3,1,1], 4))