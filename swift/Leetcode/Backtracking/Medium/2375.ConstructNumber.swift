// num consists of the digits '1' to '9', where each digit is used at most once.
// If pattern[i] == 'I', then num[i] < num[i + 1].
// If pattern[i] == 'D', then num[i] > num[i + 1].
// Return the lexicographically smallest possible string num that meets the conditions.

func smallestNumber(_ pattern: String) -> String {
    let pattern = Array(pattern)
    let nums: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var result = String(repeating: "9", count: pattern.count + 1)

    func backtracking(_ index: Int, _ numbers: Set<Character>, _ current: String) {
        if index == pattern.count { 
            result = min(result, current)
            return
        }

        let char = pattern[index]
        let last = current.last!

        for number in nums {
            if char == "I", !numbers.contains(number), last < number {
                var hashSet = numbers
                hashSet.insert(number)
                backtracking(index + 1, hashSet, current + String(number))
            } else if char == "D", !numbers.contains(number), last > number {
                var hashSet = numbers
                hashSet.insert(number)
                backtracking(index + 1, hashSet, current + String(number))
            }
        }
    }

    for number in nums {
        var hashSet = Set<Character>()
        hashSet.insert(number)
        backtracking(0, hashSet, String(number))
    }

    return result
}

print(smallestNumber("IIIDIDDD"))
print(smallestNumber("DDD"))