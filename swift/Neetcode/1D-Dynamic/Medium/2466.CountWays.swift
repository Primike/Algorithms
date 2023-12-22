// Return the number of different good strings that can be constructed satisfying these properties. 
// Since the answer can be large, return it modulo 109 + 7.

func countGoodStrings(_ low: Int, _ high: Int, _ zero: Int, _ one: Int) -> Int {
    var tab = Array(repeating: 0, count: high + 1)
    tab[0] = 1
    let mod = 1_000_000_007

    //Skip 0s not needed
    for i in 0..<high {
        if i + zero <= high { tab[i + zero] += (tab[i] % mod) }
        if i + one <= high { tab[i + one] += (tab[i] % mod) }
    }

    return tab[low...high].reduce(0) { ($0 + $1) % mod }
}

print(countGoodStrings(3, 3, 1, 1))
print(countGoodStrings(2, 3, 1, 2))