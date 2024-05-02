// A wonderful string is a string where at most one letter appears an odd number of times.
// For example, "ccjjc" and "abab" are wonderful, but "ab" is not.
// Given a string word that consists of the first ten lowercase 
// English letters ('a' through 'j'), return the number of wonderful 
// non-empty substrings in word. If the same substring appears 
// multiple times in word, then count each occurrence separately.

func wonderfulSubstrings(_ word: String) -> Int {
    let word = Array(word)
    var frequency = Array(repeating: 0, count: 1024)
    frequency[0] = 1
    var result = 0
    var currentMask = 0
            
    for character in word {
        let index = Int(character.asciiValue! - 97)
        currentMask ^= (1 << index)
        result += frequency[currentMask]
        
        for i in 0..<10 {
            let toggleMask = currentMask ^ (1 << i)
            result += frequency[toggleMask]
        }
        
        frequency[currentMask] += 1
    }
    
    return result
}

print(wonderfulSubstrings("aba"))
print(wonderfulSubstrings("aabb"))
print(wonderfulSubstrings("he"))