// Given two integer arrays pushed and popped each with distinct values, 
// return true if this could have been the result of a sequence of push and pop 
// operations on an initially empty stack, or false otherwise.

func validateStackSequences(_ pushed: [Int], _ popped: [Int]) -> Bool {
    var stack = [Int]()
    var j = 0

    for number in pushed {
        stack.append(number)

        while let last = stack.last, popped[j] == last {
            stack.removeLast()
            j += 1
        }
    }

    return stack.isEmpty
}

print(validateStackSequences([1,2,3,4,5], [4,5,3,2,1]))
print(validateStackSequences([1,2,3,4,5], [4,3,5,1,2]))