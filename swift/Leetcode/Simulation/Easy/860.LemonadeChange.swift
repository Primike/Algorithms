// At a lemonade stand, each lemonade costs $5. Customers are standing 
// in a queue to buy from you and order one at a time (in the order specified by bills). 
// Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill. 
// You must provide the correct change to each customer so that the net transaction 
// is that the customer pays $5.
// Note that you do not have any change in hand at first.
// Given an integer array bills where bills[i] is the bill the ith customer pays, 
// return true if you can provide every customer with the correct change, or false otherwise.

// Time: O(n), Space: O(1)
func lemonadeChange(_ bills: [Int]) -> Bool {
    var cashier = [5: 0, 10: 0]

    for bill in bills {
        cashier[bill, default: 0] += 1

        if bill == 5 { continue }

        var change = bill - 5

        if cashier[10]! > 0 { 
            let count = change / 10
            change -= min(count, cashier[10]!) * 10
            cashier[10]! -= min(count, cashier[10]!)
        } 

        if cashier[5]! > 0 { 
            let count = change / 5
            change -= min(count, cashier[5]!) * 5
            cashier[5]! -= min(count, cashier[5]!)
        } 

        if change > 0 { return false }
    }

    return true 
}

print(lemonadeChange([5,5,5,10,20]))
print(lemonadeChange([5,5,10,10,20]))