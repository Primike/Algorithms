// A good string is a string which doesn't have two adjacent characters 
// s[i] and s[i + 1] where: 0 <= i <= s.length - 2
// s[i] is a lower-case letter and s[i + 1] is the same letter 
// but in upper-case or vice-versa.
// Return the string after making it good. 

// Time: O(n), Space: O(n)
func makeGood(_ s: String) -> String {
    let s = Array(s)
    var stack = [Character]()

    for letter in s {
        let string = String(letter)

        if let last = stack.last, (last.lowercased() == string || last.uppercased() == string),
            String(last) != string {
            stack.removeLast()
        } else {
            stack.append(letter)
        }
    }

    return String(stack)
}

print(makeGood("leEeetcode"))
print(makeGood("abBAcC"))
print(makeGood("s"))