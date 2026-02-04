// You are given an array of characters letters that is sorted 
// in non-decreasing order, and a character target. 
// There are at least two different characters in letters.
// Return the smallest character in letters that is 
// lexicographically greater than target. If such a 
// character does not exist, return the first character in letters.

// Time: O(log(n)), Space: O(1)
func nextGreatestLetter(_ letters: [Character], _ target: Character) -> Character {
    var left = 0, right = letters.count - 1

    while left < right {
        let mid = (right + left) / 2

        if letters[mid] > target {
            right = mid
        } else {
            left = mid + 1
        }
    }

    return letters[left] > target ? letters[left] : letters[0]
}

print(nextGreatestLetter(["c","f","j"], "a"))
print(nextGreatestLetter(["c","f","j"], "c"))
print(nextGreatestLetter(["x","x","y","y"], "z"))