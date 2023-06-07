//Given a string s that represents a DNA sequence, 
//return all the 10-letter-long sequences (substrings) that occur more than 
//once in a DNA molecule. You may return the answer in any order.

func findRepeatedDnaSequences(_ s: String) -> [String] {
    var dnaSet = Set<String>()
    var result = Set<String>()
    let sArray = Array(s)

    for i in 0..<(sArray.count - 9) {
        let sequence = String(sArray[i..<(i + 10)])

        if dnaSet.contains(sequence) {
            result.insert(sequence)
        }

        dnaSet.insert(sequence)
    }

    return Array(result)
}

print(findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"))
print(findRepeatedDnaSequences("AAAAAAAAAAAAA"))