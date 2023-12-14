// Write a function that reverses a string. 
// The input string is given as an array of characters s.
// You must do this by modifying the input array in-place with O(1) extra memory.

func reverseString(_ s: inout [Character]) {
    var left = 0

    while left < s.count / 2 {
        s.swapAt(left, s.count - 1 - left)

        left += 1
    }
}

print(reverseString(["h","e","l","l","o"]))
print(reverseString(["H","a","n","n","a","h"]))