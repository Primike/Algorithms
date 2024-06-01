// You are given a 0-indexed integer array tickets of length n where 
// the number of tickets that the ith person would like to buy is tickets[i].
// Each person takes exactly 1 second to buy a ticket. 
// A person can only buy 1 ticket at a time and has to go back 
// to the end of the line (which happens instantaneously) 
// in order to buy more tickets. If a person does not have any tickets left to buy, 
// the person will leave the line.
// Return the time taken for the person at position k 
// (0-indexed) to finish buying tickets.

// Time: O(n), Space: O(1)
func timeRequiredToBuy(_ tickets: [Int], _ k: Int) -> Int {
    var result = 0

    for i in 0..<tickets.count {
        if i <= k {
            result += min(tickets[k], tickets[i])
        } else {
            result += min(tickets[k] - 1, tickets[i])
        }
    }

    return result
}

print(timeRequiredToBuy([2,3,2], 2))
print(timeRequiredToBuy([5,1,1,1], 0))