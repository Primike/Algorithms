// You are given a string s and an integer k, a k duplicate removal consists 
// of choosing k adjacent and equal letters from s and removing them, 
// causing the left and the right side of the deleted substring to concatenate together.
// Return the final string after all such duplicate removals have been made. 

func removeDuplicates(_ s: String, _ k: Int) -> String {
    var stack = [(Character, Int)]()

    for letter in s {
        if let last = stack.last, last.0 == letter {
            stack[stack.count - 1].1 += 1
        } else {
            stack.append((letter, 1))
        }

        if stack.last!.1 == k { stack.removeLast() }
    }

    return stack.reduce(into: "") { $0 += String(repeating: $1.0, count: $1.1) }
}

print(removeDuplicates("abcd", 2))
print(removeDuplicates("deeedbbcccbdaa", 3))
print(removeDuplicates("pbbcggttciiippooaais", 2))