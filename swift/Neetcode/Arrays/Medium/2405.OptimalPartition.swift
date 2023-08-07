// Given a string s, partition the string into one or more substrings 
// such that the characters in each substring are unique. 
// That is, no letter appears in a single substring more than once.
// Return the minimum number of substrings in such a partition.

func partitionString(_ s: String) -> Int {
    var s = Array(s)
    var letterSet = Set<Character>()
    var result = 1

    for (i, letter) in s.enumerated() {
        if letterSet.contains(letter) {
            result += 1
            letterSet = Set<Character>()
        } 

        letterSet.insert(letter)
    }

    return result
}

print(partitionString("abacaba"))
print(partitionString("ssssss"))