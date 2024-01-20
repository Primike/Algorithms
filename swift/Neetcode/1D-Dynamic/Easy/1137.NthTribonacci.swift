// Given n, return the value of Tn.

// Time: O(n), Space: O(1)
func tribonacci(_ n: Int) -> Int {
    if n == 0 { return 0 }
    if n <= 2 { return 1 }

    var third = 0, second = 1, current = 1

    for i in 3..<(n + 1) {
        var temp1 = second, temp2 = current

        current += third + second

        third = temp1
        second = temp2
    }

    return current
}

print(tribonacci(4))
print(tribonacci(25))