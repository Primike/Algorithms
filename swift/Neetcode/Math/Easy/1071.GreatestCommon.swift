// Given two strings str1 and str2, return the largest string x 
// such that x divides both str1 and str2.

// All possible divisors of 2 numbers divide the gcd

// Time: O(n + m), Space: O(gcd)
func gcdOfStrings(_ str1: String, _ str2: String) -> String {
    if str1 + str2 != str2 + str1 { return "" }

    func euclideanAlgorithm(_ x: Int, _ y: Int) -> Int {
        var largest = max(x, y), smallest = min(x, y)

        while largest % smallest != 0 { 
            let remainder = largest % smallest
            largest = smallest
            smallest = remainder
        }

        return smallest
    }

    return String(str1.prefix(euclideanAlgorithm(str1.count, str2.count)))
}

print(gcdOfStrings("ABCABC", "ABC"))
print(gcdOfStrings("ABABAB", "ABAB"))
print(gcdOfStrings("LEET", "CODE"))

func gcdOfStrings2(_ str1: String, _ str2: String) -> String {
    var result = ""

    for i in 0..<str2.count {
        let substring = String(str2.prefix(i + 1))

        if str1.replacingOccurrences(of: substring, with: "") == "",  str2.replacingOccurrences(of: substring, with: "") == "" {
            if substring.count > result.count { result = substring }
        }
    }

    return result
}