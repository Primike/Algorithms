// Given two strings s and t of lengths m and n respectively, return the 
// minimum window substring of s such that every character in t (including duplicates) 
// is included in the window. If there is no such substring, return the empty string "".

func minWindow(_ s: String, _ t: String) -> String {
    if t.count > s.count { return "" }

    var sArray = Array(s), tArray = Array(t)
    var sDict = [Character: Int](), tDict = [Character: Int]()

    for char in tArray {
        tDict[char, default: 0] += 1
    }

    var left = 0
    var start = 0, end = 0
    var count = 0
    var currentLength = Int.max

    for i in 0..<sArray.count {
        let letter = sArray[i]

        if tDict.keys.contains(letter) {
            sDict[letter, default: 0] += 1

            if sDict[letter, default: 0] == tDict[letter, default: 0] { count += 1 }
        }

        while count == tDict.count {
            if i + 1 - left < currentLength {
                currentLength = i + 1 - left
                start = left
                end = i
            }

            if sDict.keys.contains(sArray[left]) {
                sDict[sArray[left], default: 0] -= 1

                if sDict[sArray[left], default: 0] < tDict[sArray[left], default: 0] {
                    count -= 1
                }
            }
            
            left += 1
        }
    }

    if currentLength < Int.max { return String(sArray[start...end]) }
    
    return ""
}

print(minWindow("ADOBECODEBANC", "ABC"))
print(minWindow("a", "a"))
print(minWindow("a", "aa"))