// You are given an integer n.
// Each number from 1 to n is grouped according to the sum of its digits.
// Return the number of groups that have the largest size.

// Time: O(n * log10(n)), Space: O(n)
func countLargestGroup(_ n: Int) -> Int {
    var dict = [Int: Int]()

    for i in 1...n {
        var current = i
        var sum = 0

        while current > 0 {
            sum += current % 10
            current /= 10     
        }

        dict[sum, default: 0] += 1
    }

    let maximum = dict.values.max() ?? 0
    return dict.values.filter { $0 == maximum }.count
}

print(countLargestGroup(13))
print(countLargestGroup(2))