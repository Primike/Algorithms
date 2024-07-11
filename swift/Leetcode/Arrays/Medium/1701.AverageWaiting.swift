// There is a restaurant with a single chef. 
// You are given an array customers, where customers[i] = [arrivali, timei]:
// arrivali is the arrival time of the ith customer. 
// The arrival times are sorted in non-decreasing order.
// timei is the time needed to prepare the order of the ith customer.
// Return the average waiting time of all customers.

// Time: O(n), Space: O(1)
func averageWaitingTime(_ customers: [[Int]]) -> Double {
    var total = 0
    var time = 0

    for customer in customers {
        if time < customer[0] { time = customer[0] }

        time += customer[1]
        total += time - customer[0]
    }

    return Double(total) / Double(customers.count)
}

print(averageWaitingTime([[1,2],[2,5],[4,3]]))
print(averageWaitingTime([[5,2],[5,4],[10,3],[20,1]]))