// A fancy string is a string where no three consecutive characters are equal.
// Given a string s, delete the minimum possible number of 
// characters from s to make it fancy.
// Return the final string after the deletion. 
// It can be shown that the answer will always be unique.

// Time: O(n), Space: O(n)
func makeFancyString(_ s: String) -> String {
    var result = [Character]()
    var last = Character("1")
    var count = 0

    for letter in s {
        if letter != last {
            last = letter
            count = 1
            result.append(letter)
        } else if letter == last, count < 2{
            count += 1
            result.append(letter)
        }
    }

    return String(result)
}

print(makeFancyString("leeetcode"))
print(makeFancyString("aaabaaaa"))
print(makeFancyString("aab"))