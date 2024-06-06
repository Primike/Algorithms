// Given a signed 32-bit integer x, return x with its digits reversed. 
// If reversing x causes the value to go outside the signed 32-bit integer range 
// [-231, 231 - 1], then return 0.

func reverse(_ x: Int) -> Int {
    var number = Array(String(x))
    var negative = number[0] == "-" ? true : false

    if negative { number.removeFirst() }

    while let last = number.last, last == "0" { 
        number.removeLast()
    }

    var newNumber = String(number.reversed())
    if negative { newNumber = "-" + newNumber }
    if let result = Int32(newNumber) { return Int(result) }

    return 0 
}

print(reverse(123))
print(reverse(-123))
print(reverse(120))