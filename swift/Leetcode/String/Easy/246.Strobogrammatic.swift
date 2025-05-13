// Given a string num which represents an integer, 
// return true if num is a strobogrammatic number.
// A strobogrammatic number is a number that 
// looks the same when rotated 180 degrees (looked at upside down).

// Time: O(n), Space: O(1)
func isStrobogrammatic(_ num: String) -> Bool {
    let num = String(num).map { String($0) }
    let dict = ["0": "0", "1": "1", "6": "9", "8": "8", "9": "6"]
    var left = 0, right = num.count - 1

    while left < right {
        if dict[num[left]] == nil || dict[num[right]] == nil { return false }
        if dict[num[left]]! != num[right] { return false }
        if dict[num[right]]! != num[left] { return false }

        left += 1
        right -= 1
    }

    if left > right { return true }
    return ["0", "1", "8"].contains(num[left])
}

print(isStrobogrammatic("69"))
print(isStrobogrammatic("88"))
print(isStrobogrammatic("962"))