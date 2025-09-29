// While there is a '*', do the following operation:
// Delete the leftmost '*' and the smallest non-'*' character to its left. 
// If there are several smallest characters, you can delete any of them.
// Return the lexicographically smallest resulting string after 
// removing all '*' characters.

// Time: O(n * 26), Space: O(1)
func clearStars(_ s: String) -> String {
    var s = Array(s)
    var letters = Array(repeating: [Int](), count: 26)
    let aAscii = Character("a").asciiValue!

    for (i, char) in s.enumerated() {
        if char != "*" {
            let index = Int(char.asciiValue! - aAscii)
            letters[index].append(i)
        } else {
            for j in 0..<26 {
                if !letters[j].isEmpty {
                    s[letters[j].removeLast()] = "*"
                    break
                }
            }
        }
    }
    
    return String(s.filter { $0 != "*" })
}

print(clearStars("aaba*"))
print(clearStars("abc"))