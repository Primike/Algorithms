// Given string num representing a non-negative integer num, and 
// an integer k, return the smallest possible integer after removing k digits from num.

func removeKdigits(_ num: String, _ k: Int) -> String {        
    var stack = [Character]()
    var k = k
    
    for number in num {
        while let last = stack.last, last > number, k > 0  {
            stack.removeLast()
            k -= 1
        }

        if stack.isEmpty, number == "0" { continue }

        stack.append(number)
    }
    
    while !stack.isEmpty, k > 0 {
        stack.removeLast()
        k -= 1
    }
    
    return stack.isEmpty ? "0" : String(stack)
}

print(removeKdigits("1432219", 3))
print(removeKdigits("10200", 1))
print(removeKdigits("10", 2))