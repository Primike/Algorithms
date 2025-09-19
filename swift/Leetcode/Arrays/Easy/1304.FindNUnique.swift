// Given an integer n, return any array containing n 
// unique integers such that they add up to 0.

// Time: O(n), Space: O(n)
func sumZero(_ n: Int) -> [Int] {
    if n == 1 { return [0] }

    var result = [Int]()

    for i in 1..<(n/2 + 1) {
        result.append(i)
        result.append(-i)
    }

    if n % 2 != 0 { result.append(0) }
    return result
}

print(sumZero(5))
print(sumZero(3))
print(sumZero(1))