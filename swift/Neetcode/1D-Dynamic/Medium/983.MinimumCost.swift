// Return the minimum number of dollars you need to travel every day in the given list of days.

// Time: O(n), Space: O(n)
func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
    var tab = Array(repeating: Int.max, count: days[days.count - 1] + 1)
    let daysSet = Set(days)
    tab[0] = 0

    for i in 0..<(tab.count - 1) {
        if !daysSet.contains(i + 1) {
            tab[i + 1] = min(tab[i + 1], tab[i]) 
            continue
        }

        tab[i + 1] = min(tab[i + 1], tab[i] + costs[0])

        var index = min(i + 7, tab.count - 1)
        tab[index] = min(tab[index], tab[i] + costs[1])

        index = min(i + 30, tab.count - 1)
        tab[index] = min(tab[index], tab[i] + costs[2])
    }

    return tab[tab.count - 1]
}

print(mincostTickets([1,4,6,7,8,20], [2,7,15]))
print(mincostTickets([1,2,3,4,5,6,7,8,9,10,30,31], [2,7,15]))


func mincostTickets2(_ days: [Int], _ costs: [Int]) -> Int {
    var tab = Array(repeating: Int.max, count: days.count + 1)
    tab[0] = 0

    for i in 1...days.count {
        tab[i] = tab[i - 1] + costs[0]
        var j = i - 1

        while j >= 0, days[i - 1] < days[j] + 7 {
            j -= 1
        }

        tab[i] = min(tab[i], tab[j + 1] + costs[1])

        while j >= 0, days[i - 1] < days[j] + 30 {
            j -= 1
        }
        
        tab[i] = min(tab[i], tab[j + 1] + costs[2])
    }

    return tab[days.count]
}

func mincostTickets3(_ days: [Int], _ costs: [Int]) -> Int {
    var tab = Array(repeating: Int.max, count: days.count + 1)
    tab[0] = 0

    for index in 0..<days.count {
        var i = index, j = index, k = index

        while i < days.count, days[index] + 1 > days[i] {
            i += 1
        }

        while j < days.count, days[index] + 7 > days[j] {
            j += 1
        }
        
        while k < days.count, days[index] + 30 > days[k] {
            k += 1
        }

        tab[i] = min(tab[i], tab[index] + costs[0])
        tab[j] = min(tab[j], tab[index] + costs[1])
        tab[k] = min(tab[k], tab[index] + costs[2])
    }

    return tab[tab.count - 1]
}

func mincostTickets4(_ days: [Int], _ costs: [Int]) -> Int {
    var memo = [Int: Int]()

    func dp(_ i: Int) -> Int {
        if i >= days.count { return 0 }
        if let value = memo[i] { return value }

        var result = dp(i + 1) + costs[0]
        var j = i

        while j < days.count, days[i] + 7 > days[j] {
            j += 1
        }

        result = min(result, dp(j) + costs[1])

        while j < days.count, days[i] + 30 > days[j] {
            j += 1
        }

        result = min(result, dp(j) + costs[2])
        
        memo[i] = result
        return result
    }

    return dp(0)
}