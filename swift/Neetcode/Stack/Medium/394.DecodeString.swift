// Given an encoded string, return its decoded string.

func decodeString(_ s: String) -> String {
    var result = [String]()

    for char in s {
        if char != "]" {
            result.append(String(char))
            continue 
        }

        var string = ""

        while let last = result.last, last != "[" {
            string = result.removeLast() + string
        }

        result.removeLast()
        var number = ""

        while let last = result.last, let _ = Int(last) {
            number = result.removeLast() + number
        }

        result.append(String(repeating: string, count: Int(number) ?? 0))
    }

    return result.joined()
}

print(decodeString("3[a]2[bc]"))
print(decodeString("3[a2[c]]"))
print(decodeString("2[abc]3[cd]ef"))