// You are given an integer array ranks representing the 
// ranks of some mechanics. ranksi is the rank of the ith mechanic. 
// A mechanic with a rank r can repair n cars in r * n2 minutes.
// You are also given an integer cars representing the total number 
// of cars waiting in the garage to be repaired.
// Return the minimum time taken to repair all the cars.

// Time: O(n * log(min(n) * c^2)), Space: O(1)
func repairCars(_ ranks: [Int], _ cars: Int) -> Int {
    let ranks = ranks.map { Double($0) }
    var left = 1, right = Int(ranks.min() ?? 0) * cars * cars

    while left < right {
        let mid = (right + left) / 2
        var count = 0

        for rank in ranks {
            count += Int(sqrt((Double(mid) / rank)))
        }

        if count >= cars {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return left
}

print(repairCars([4,2,3,1], 10))
print(repairCars([5,1,8], 6))