// You are given a string s, which contains stars *.
// Remove the closest non-star character to its left, as well as remove the star itself.
// Return the string after all stars have been removed.

func removeStars(_ s: String) -> String {
    var s = Array(s)
    var stack: [Character] = []

    for char in s {
        if char == "*" {
            stack.removeLast()
        } else {
            stack.append(char)
        }
    }

    return String(stack)
}

print(removeStars("leet**cod*e"))
print(removeStars("erase*****"))