// Return the maximum number of points you can earn by applying 
// the above operation some number of times.

func deleteAndEarn(_ nums: [Int]) -> Int {
    var count = nums.reduce(into: [:]) { $0[$1, default: 0] += $1 }
    
    let limit = (nums.max() ?? 0) + 1
    var tab = Array(repeating: 0, count: limit)
    tab[0] = 0
    tab[1] = count[1, default: 0]

    for i in 2..<limit {
        tab[i] = max(tab[i - 2] + count[i, default: 0], tab[i - 1])
    }

    return tab[limit - 1]
}

print(deleteAndEarn([3,4,2]))
print(deleteAndEarn([2,2,3,3,3,4]))