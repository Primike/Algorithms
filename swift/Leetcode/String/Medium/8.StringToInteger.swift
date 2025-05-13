// Implement the myAtoi(string s) function, 
// which converts a string to a 32-bit signed integer.
// The algorithm for myAtoi(string s) is as follows:
// Whitespace: Ignore any leading whitespace (" ").
// Signedness: Determine the sign by checking if the next character 
// is '-' or '+', assuming positivity if neither present.
// Conversion: Read the integer by skipping leading zeros 
// until a non-digit character is encountered or the 
// end of the string is reached. If no digits were read, then the result is 0.
// Rounding: If the integer is out of the 32-bit 
// signed integer range [-231, 231 - 1], then round the integer 
// to remain in the range. Specifically, integers less than -231 
// should be rounded to -231, and integers greater than 231 - 1 
// should be rounded to 231 - 1.
// Return the integer as the final result.

// Time: O(n), Space: O(n)
func myAtoi(_ s: String) -> Int {
    let s = Array(s)
    var i = 0

    while i < s.count, s[i] == " " {
        i += 1
    }

    var isPositive = true

    if i < s.count, s[i] == "-" || s[i] == "+" {
        isPositive = s[i] == "+"
        i += 1
    }

    while i < s.count, s[i].isNumber, s[i] == "0" {
        i += 1
    }

    var number = ""

    while i < s.count, s[i].isNumber {
        number.append(s[i])
        i += 1
    }

    guard var integer = Int(number) else { 
        if number.isEmpty {
            return 0
        } else if isPositive {
            return Int(Int32.max)
        } else {
            return Int(Int32.min)
        }
    }

    if !isPositive { integer *= -1 }
    if integer > Int32.max { return Int(Int32.max) }
    if integer < Int32.min { return Int(Int32.min) }
    
    return integer
}

print(myAtoi("42"))
print(myAtoi(" -042"))
print(myAtoi("1337c0d3"))
print(myAtoi("0-1"))
print(myAtoi("words and 987"))