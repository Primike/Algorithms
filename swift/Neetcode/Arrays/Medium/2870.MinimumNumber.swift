// There are two types of operations that you can apply on the array any number of times:
// Choose two elements with equal values and delete them from the array.
// Choose three elements with equal values and delete them from the array.
// Return the minimum number of operations required to make the array empty, 
// or -1 if it is not possible.

// Time: O(n), Space: O(n)
func minOperations(_ nums: [Int]) -> Int {
    let dict = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = 0

    for count in dict.values {
        if count == 1 { return -1 }
        result += Int(ceil(Double(count) / 3.0))
    }

    return result
}

print(minOperations([2,3,3,2,2,4,2,3,4]))
print(minOperations([2,1,2,2,3,3]))


func minOperations2(_ nums: [Int]) -> Int {
    var array = nums.reduce(into: [:]) { $0[$1, default: 0] += 1 }.values

    func dp(_ current: Int) -> Int {
        var tab = Array(repeating: Int.max, count: current + 1)
        tab[0] = 0

        for i in 0...current {
            if tab[i] == .max { continue }
            if i + 2 <= current { tab[i + 2] = min(tab[i + 2], tab[i] + 1) }
            if i + 3 <= current { tab[i + 3] = min(tab[i + 3], tab[i] + 1) }
        }

        return tab[current]
    }

    var result = 0

    for number in array {
        let total = dp(number)

        if total == .max { return -1 }
        result += total
    }

    return result
}
