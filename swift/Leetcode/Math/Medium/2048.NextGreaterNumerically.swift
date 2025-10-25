// An integer x is numerically balanced if for every digit d 
// in the number x, there are exactly d occurrences of that digit in x.
// Given an integer n, return the smallest numerically 
// balanced number strictly greater than n.

// Time: O(n * log10(n)), Space: O(n)
func nextBeautifulNumber(_ n: Int) -> Int {
    for i in (n + 1)...1224445 {
        var dict = [Int: Int]()
        var current = i

        while current > 0 {
            let digit = current % 10
            dict[digit, default: 0] += 1
            current /= 10
        }

        var isValid = true

        for (key, value) in dict {
            if key != value { isValid = false }
        }

        if isValid { return i }
    }

    return -1
}

print(nextBeautifulNumber(1))
print(nextBeautifulNumber(1000))
print(nextBeautifulNumber(3000))