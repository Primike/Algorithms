// You are given an array of transactions transactions where 
// transactions[i] = [fromi, toi, amounti] indicates that the person with 
// ID = fromi gave amounti $ to the person with ID = toi.
// Return the minimum number of transactions required to settle the debt.

// Time: O(n!), Space: O(n)
func minTransfers(_ transactions: [[Int]]) -> Int {
    var balances = Array(repeating: 0, count: 12)

    for transaction in transactions {
        balances[transaction[0]] -= transaction[2]
        balances[transaction[1]] += transaction[2]
    }

    balances = balances.filter { $0 != 0 }

    func backtrack(_ index: Int) -> Int {
        var index = index

        while index < balances.count, balances[index] == 0 {
            index += 1
        }

        if index == balances.count { return 0 }
        var result = Int.max

        for i in (index + 1)..<balances.count {
            if balances[index] * balances[i] > 0 { continue }

            balances[i] += balances[index]
            result = min(result, 1 + backtrack(index + 1))
            balances[i] -= balances[index]
        }

        return result
    }

    return backtrack(0)
}

print(minTransfers([[0,1,10],[2,0,5]]))
print(minTransfers([[0,1,10],[1,0,1],[1,2,5],[2,0,5]]))