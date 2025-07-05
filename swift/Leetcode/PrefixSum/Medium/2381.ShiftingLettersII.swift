// You are given a string s of lowercase English letters and a 
// 2D integer array shifts where shifts[i] = [starti, endi, directioni]. 
// For every i, shift the characters in s from the index starti 
// to the index endi (inclusive) forward if directioni = 1, 
// or shift the characters backward if directioni = 0.
// Shifting a character forward means replacing it with the 
// next letter in the alphabet (wrapping around so that 'z' becomes 'a'). 
// Similarly, shifting a character backward means replacing it with 
// the previous letter in the alphabet (wrapping around so that 'a' becomes 'z').
// Return the final string after all such shifts to s are applied.

// Time: O(n), Space: O(n)
func shiftingLetters(_ s: String, _ shifts: [[Int]]) -> String {
    let s = Array(s)
    var shiftCounts = Array(repeating: 0, count: s.count)

    for shift in shifts {
        let direction = shift[2] == 1 ? 1 : -1

        shiftCounts[shift[0]] += direction
        
        if shift[1] + 1 < s.count {
            shiftCounts[shift[1] + 1] -= direction
        }
    }

    var current = 0
    var result = [Character]()

    for i in 0..<s.count {
        current += shiftCounts[i]
        let ascii = Int(s[i].asciiValue!) - 97
        let nextAscii = (ascii + current % 26 + 26) % 26
        let letter = Character(UnicodeScalar(97 + nextAscii)!)
        result.append(letter)
    }

    return String(result)
}

print(shiftingLetters("abc", [[0,1,0],[1,2,1],[0,2,1]]))
print(shiftingLetters("dztz", [[0,0,0],[1,1,1]]))