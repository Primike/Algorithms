// You are given the customer visit log of a shop represented by a 0-indexed 
// string customers consisting only of characters 'N' and 'Y':
// Return the earliest hour at which the shop must be closed 
// to incur a minimum penalty.

func bestClosingTime(_ customers: String) -> Int {
    let customers = Array(customers)
    var count = 0

    for i in stride(from: customers.count - 1, to: -1, by: -1) {
        if customers[i] == "Y" { count += 1 }
    }

    var current = count
    var minimum = Int.max
    var result = 0

    for (i, hour) in customers.enumerated() {
        if current < minimum { 
            minimum = current 
            result = i
        }

        if hour == "Y" { current -= 1 }
        if hour == "N" { current += 1 }
    } 

    return current < minimum ? customers.count : result
}   

print(bestClosingTime("YYNY"))
print(bestClosingTime("NNNNN"))
print(bestClosingTime("YYYY"))