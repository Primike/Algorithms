// We can shift a string by shifting each of its letters to its successive letter.
// For example, "abc" can be shifted to be "bcd".
// We can keep shifting the string to form a sequence.
// For example, we can keep shifting "abc" to form the sequence: 
// "abc" -> "bcd" -> ... -> "xyz".
// Given an array of strings strings, group all strings[i] that 
// belong to the same shifting sequence. You may return the answer in any order.

// Time: O(m * n), Space: O(n)
func groupStrings(_ strings: [String]) -> [[String]] {
    var result = [String: [String]]()

    for string in strings {
        let array = Array(string)
        var differences = [Int]()

        for i in 1..<array.count {
            let ascii1 = Int(array[i].asciiValue! - 97)
            let ascii2 = Int(array[i - 1].asciiValue! - 97)
            let value = ascii1 - ascii2 + (ascii2 > ascii1 ? 26 : 0)
            differences.append(value)
        }

        let key = differences.map { String($0) }.joined(separator: ",")
        result[key, default: []].append(string)
    }

    return Array(result.values)
}

print(groupStrings(["abc","bcd","acef","xyz","az","ba","a","z"]))
print(groupStrings(["a"]))