// You are given a string s and a robot that currently holds an empty string t. 
// Apply one of the following operations until s and t are both empty:
// Remove the first character of a string s and give it to the robot. 
// The robot will append this character to the string t.
// Remove the last character of a string t and give it to the robot. 
// The robot will write this character on paper.
// Return the lexicographically smallest string that can be written on the paper.

func robotWithString(_ s: String) -> String {
    var dict = s.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = [Character]()
    var stack = [Character]()
    var minChar = Character("a")

    for char in s {
        stack.append(char)
        dict[char, default: 0] -= 1

        while minChar < "z", dict[minChar, default: 0] == 0 {
            let nextAscii = minChar.asciiValue! + 1
            minChar = Character(UnicodeScalar(nextAscii))
        }

        while let last = stack.last, last <= minChar {
            result.append(stack.removeLast())
        }
    }

    result.append(contentsOf: stack.reversed())
    
    return String(result)
}

print(robotWithString("zza"))
print(robotWithString("bac"))
print(robotWithString("bdda"))