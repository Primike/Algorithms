// Given a string s that represents a DNA sequence, 
// return all the 10-letter-long sequences (substrings) that occur more than 
// once in a DNA molecule. You may return the answer in any order.

func findRepeatedDnaSequences(_ s: String) -> [String] {
    if s.count < 10 { return [] }
    
    let sArray = Array(s)
    var currentDNA = String(s.prefix(10))
    var dnaDict = [currentDNA: 1]

    for i in 10..<sArray.count {
        currentDNA.removeFirst()
        currentDNA += String(sArray[i])

        dnaDict[currentDNA, default: 0] += 1
    }

    return dnaDict.filter { $0.value > 1 }.map { $0.key }
}

print(findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"))
print(findRepeatedDnaSequences("AAAAAAAAAAAAA"))