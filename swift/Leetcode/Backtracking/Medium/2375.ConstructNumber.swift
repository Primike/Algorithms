// num consists of the digits '1' to '9', where each digit is used at most once.
// If pattern[i] == 'I', then num[i] < num[i + 1].
// If pattern[i] == 'D', then num[i] > num[i + 1].
// Return the lexicographically smallest possible string num that meets the conditions.

// Time: O(9!), Space: O(pattern)
func smallestNumber(_ pattern: String) -> String {
    let pattern = Array(pattern)
    let numbers: [Character] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var numSet = Set<Character>()
    var current = [Character]()
    var result = "999999999"

    func backtrack(_ index: Int) {
        if index == pattern.count {
            if String(current) < result { result = String(current) }
            return 
        }

        for n in numbers {
            if numSet.contains(n) { continue }
            
            let last = current.last!
            numSet.insert(n)
            current.append(n)

            if pattern[index] == "I", n > last {
                backtrack(index + 1)
            } else if pattern[index] == "D", n < last {
                backtrack(index + 1)
            }
            
            current.removeLast()
            numSet.remove(n)
        }
    }

    for n in numbers {
        numSet.insert(n)
        current.append(n)
        backtrack(0)
        current.removeLast()
        numSet.remove(n)
    }

    return result
}

print(smallestNumber("IIIDIDDD"))
print(smallestNumber("DDD"))