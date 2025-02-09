// num consists of the digits '1' to '9', where each digit is used at most once.
// If pattern[i] == 'I', then num[i] < num[i + 1].
// If pattern[i] == 'D', then num[i] > num[i + 1].
// Return the lexicographically smallest possible string num that meets the conditions.

// Time: O(9!), Space: O(pattern)
func smallestNumber(_ pattern: String) -> String {
    let pattern = Array(pattern)
    let numbers = Array("123456789")
    var result = Array("9999999999")
    var numberSet = Set<Character>()

    func backtrack(_ i: Int, _ current: [Character]) {
        if i == pattern.count { 
            if String(current) < String(result) { result = current }
            return
        }

        for number in numbers {
            if numberSet.contains(number) { continue }
            if number > result[i + 1] { continue }

            numberSet.insert(number)

            if pattern[i] == "I", current.last! < number {
                backtrack(i + 1, current + [number])
            } else if pattern[i] == "D", current.last! > number{
                backtrack(i + 1, current + [number])
            }

            numberSet.remove(number)
        }
    }

    for number in numbers {
        numberSet.insert(number)
        backtrack(0, [number])
        numberSet.remove(number)
    }
    
    return String(result)
}

print(smallestNumber("IIIDIDDD"))
print(smallestNumber("DDD"))