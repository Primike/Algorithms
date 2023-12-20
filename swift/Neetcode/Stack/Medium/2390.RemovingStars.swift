// You are given a string s, which contains stars *.
// Remove the closest non-star character to its left, as well as remove the star itself.
// Return the string after all stars have been removed.

func removeStars(_ s: String) -> String {
    var stack = [Character]()

    for letter in s {
        if letter.isLetter {
            stack.append(letter)
        } else {
            stack.removeLast()
        }
    }

    return String(stack)
}

print(removeStars("leet**cod*e"))
print(removeStars("erase*****"))