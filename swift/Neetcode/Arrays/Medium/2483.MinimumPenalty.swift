// You are given the customer visit log of a shop represented by a 0-indexed 
// string customers consisting only of characters 'N' and 'Y':
// Return the earliest hour at which the shop must be closed 
// to incur a minimum penalty.

// Time: O(n), Space: O(1)
func bestClosingTime(_ customers: String) -> Int {
    let customers = Array(customers)
    var minPenalty = 0, result = 0
    var penalty = 0

    for (i, hour) in customers.enumerated() {
        penalty += hour == "Y" ? -1 : 1

        if penalty < minPenalty {
            minPenalty = penalty
            result = i + 1
        }
    }

    return result
}

print(bestClosingTime("YYNY"))
print(bestClosingTime("NNNNN"))
print(bestClosingTime("YYYY"))