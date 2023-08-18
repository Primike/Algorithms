// Given an encoded string, return its decoded string.

func decodeString(_ s: String) -> String {
    var stack: [String] = []

    for char in s {
        if char != "]" {
            stack.append(String(char))
        } else {
            var string = ""
            while let last = stack.last, last != "[" {
                string = stack.removeLast() + string
            }
            stack.removeLast()

            var number = ""
            while let last = stack.last, Character(last).isNumber {
                number = stack.removeLast() + number
            }

            if let multiplier = Int(number) {
                stack.append(String(repeating: string, count: multiplier))
            }
        }
    }

    return stack.joined()
}

print(decodeString("3[a]2[bc]"))
print(decodeString("3[a2[c]]"))
print(decodeString("2[abc]3[cd]ef"))