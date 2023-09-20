// Given an integer n, break it into the sum of k positive integers, 
// where k >= 2, and maximize the product of those integers.
// Return the maximum product you can get.

func integerBreak(_ n: Int) -> Int {
    if n <= 2 { return 1 }
    if n == 3 { return 2 }

    var tab = Array(repeating: 1, count: n + 1)

    for i in 0..<tab.count {
        for number in 1..<(n + 1) {
            let index = i + number

            if index < tab.count { 
                tab[index] = max(tab[index], tab[i] * number)
            }
        }
    }

    return tab[tab.count - 1]
}

print(integerBreak(2))
print(integerBreak(10))