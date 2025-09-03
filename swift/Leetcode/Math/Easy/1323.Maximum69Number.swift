// You are given a positive integer num consisting only of digits 6 and 9.
// Return the maximum number you can get by changing at most 
// one digit (6 becomes 9, and 9 becomes 6).

// Time: O(log10(n)), Space: O(1)
func maximum69Number (_ num: Int) -> Int {
    var current = num
    var number = 0 

    while current > 0 {
        let remainder = current % 10
        number = (number * 10) + remainder
        current /= 10
    }
    
    var foundSix = false 
    current = number
    number = 0

    while current > 0 {
        var remainder = current % 10

        if !foundSix, remainder == 6 {
            remainder = 9
            foundSix = true
        }

        number = (number * 10) + remainder
        current /= 10
    }

    return number
}

print(maximum69Number(9669))
print(maximum69Number(9996))
print(maximum69Number(9999))