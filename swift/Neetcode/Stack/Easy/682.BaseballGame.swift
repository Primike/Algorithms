// An integer x. Record a new score of x.
// '+'. Record a new score that is the sum of the previous two scores.
// 'D'. Record a new score that is the double of the previous score.
// 'C'. Invalidate the previous score, removing it from the record.
// Return the sum of all the scores on the record after applying all the operations.

func calPoints(_ operations: [String]) -> Int {
    var stack = [Int]()

    for operation in operations {
        if let number = Int(operation) {
            stack.append(number)
        } else if operation == "+", stack.count >= 2 {
            stack.append(stack[stack.count - 1] + stack[stack.count - 2])
        } else if operation == "D", !stack.isEmpty {
            stack.append(stack.last! * 2)
        } else if operation == "C", !stack.isEmpty {
            stack.removeLast()
        }
    }

    return stack.reduce(0, +)
}

print(calPoints(["5","2","C","D","+"]))
print(calPoints(["5","-2","4","C","D","9","+","+"]))
print(calPoints(["1","C"]))