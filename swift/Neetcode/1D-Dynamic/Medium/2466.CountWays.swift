// Return the number of different good strings that can be constructed satisfying these properties. 
// Since the answer can be large, return it modulo 109 + 7.

func countGoodStrings(_ low: Int, _ high: Int, _ zero: Int, _ one: Int) -> Int {
    var tab = Array(repeating: 0, count: high + 1)
    tab[0] = 1
    let mod = 1_000_000_007

    for i in 0..<tab.count {
        let index1 = i + zero
        let index2 = i + one

        if index1 < tab.count { tab[index1] = (tab[index1] + tab[i]) % mod }
        if index2 < tab.count { tab[index2] = (tab[index2] + tab[i]) % mod }
    }

    return tab[low...high].reduce(0) { ($0 + $1) % mod }
}

print(countGoodStrings(3, 3, 1, 1))
print(countGoodStrings(2, 3, 1, 2))