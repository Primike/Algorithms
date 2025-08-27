// Given a string num which represents an integer, 
// return true if num is a strobogrammatic number.
// A strobogrammatic number is a number that 
// looks the same when rotated 180 degrees (looked at upside down).

// Time: O(n), Space: O(1)
func isStrobogrammatic(_ num: String) -> Bool {
    var strobogrammatic: [Character: Character] = [
        "0": "0", "1": "1", "6": "9",
        "8": "8", "9": "6"
    ]

    let num = Array(num)
    var left = 0, right = num.count - 1

    while left <= right {
        if num[left] != strobogrammatic[num[right]] { 
            return false 
        }

        left += 1
        right -= 1
    }

    return true
}

print(isStrobogrammatic("69"))
print(isStrobogrammatic("88"))
print(isStrobogrammatic("962"))