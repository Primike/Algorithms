// You are given a string s. We want to partition the string into as many 
// parts as possible so that each letter appears in at most one part.
// Note that the partition is done so that after concatenating all the parts 
// in order, the resultant string should be s.
// Return a list of integers representing the size of these parts.

// Time: O(n), Space: O(26)
func partitionLabels(_ s: String) -> [Int] {
    let s = Array(s)
    var lastIndexOfLetter = Array(repeating: 0, count: 26)

    for i in 0..<s.count {
        lastIndexOfLetter[Int(s[i].asciiValue!) - 97] = i
    }
    
    var result = [Int]()
    var farthest = 0 
    var left = 0

    for i in 0..<s.count {
        farthest = max(farthest, lastIndexOfLetter[Int(s[i].asciiValue!) - 97])

        if i == farthest {
            result.append(i - left + 1)
            left = i + 1
        }
    }

    return result
}

print(partitionLabels("ababcbacadefegdehijhklij"))
print(partitionLabels("eccbbbbdec"))


func partitionLabels2(_ s: String) -> [Int] {
    var dict = Array(s).reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var letterSet = Set<Character>()
    var result = [Int]()
    var count = 0

    for letter in s {
        letterSet.insert(letter)
        dict[letter, default: 1] -= 1
        count += 1

        if dict[letter, default: 0] == 0 {
            dict[letter] = nil
            letterSet.remove(letter)
        }

        if letterSet.isEmpty { 
            result.append(count)
            count = 0
        }
    }

    return result
}