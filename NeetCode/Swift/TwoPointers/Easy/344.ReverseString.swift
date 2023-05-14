//Write a function that reverses a string. 
//The input string is given as an array of characters s.
//You must do this by modifying the input array in-place with O(1) extra memory.


func reverseString(_ s: inout [Character]) {
    var left = 0
    var right = s.count - 1

    while left <= right {
        s.swapAt(left, right)
        left += 1
        right -= 1
    }
}

print(reverseString(["h","e","l","l","o"]))
print(reverseString(["H","a","n","n","a","h"]))