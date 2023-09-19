// Return the minimum number of dollars you need to travel every day in the given list of days.

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