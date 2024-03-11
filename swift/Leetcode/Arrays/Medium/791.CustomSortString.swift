// You are given two strings order and s. All the characters of order 
// are unique and were sorted in some custom order previously.
// Permute the characters of s so that they match the order 
// that order was sorted. More specifically, 
// if a character x occurs before a character y in order, 
// then x should occur before y in the permuted string.
// Return any permutation of s that satisfies this property.

// Time: O(n), Space: O(1)
func customSortString(_ order: String, _ s: String) -> String {
    let s = Array(s), orderSet = Set(order)
    var sDict = [Character: Int]()
    var remainder = ""

    for letter in s {
        if orderSet.contains(letter) {
            sDict[letter, default: 0] += 1
        } else {
            remainder.append(letter)
        }
    }

    var result = ""

    for letter in order {
        result += String(repeating: letter, count: sDict[letter, default: 0])
    }

    return result + remainder
}

print(customSortString("cba", "abcd" ))
print(customSortString("bcafg", "abcd" ))