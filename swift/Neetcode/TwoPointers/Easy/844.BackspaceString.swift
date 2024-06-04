// Given two strings s and t, return true if they are equal 
// when both are typed into empty text editors. 
// '#' means a backspace character.
// Note that after backspacing an empty text, the text will continue empty.

// Time: O(n), Space: O(1)
func backspaceCompare(_ s: String, _ t: String) -> Bool {
    let s = Array(s), t = Array(t)
    var i = s.count - 1, j = t.count - 1
    var skipS = 0, skipT = 0

    while i >= 0 || j >= 0 {
        while i >= 0 {
            if s[i] == "#" {
                skipS += 1
                i -= 1
            } else if skipS > 0 {
                skipS -= 1
                i -= 1
            } else {
                break
            }
        }

        while j >= 0 {
            if t[j] == "#" {
                skipT += 1
                j -= 1
            } else if skipT > 0 {
                skipT -= 1
                j -= 1
            } else {
                break
            }
        }

        if i >= 0, j >= 0, s[i] != t[j] { return false }
        if (i >= 0) != (j >= 0) { return false }

        i -= 1
        j -= 1
    }

    return true
}

print(backspaceCompare("ab#c", "ad#c"))
print(backspaceCompare("ab##", "c#d#"))
print(backspaceCompare("a#c", "b"))