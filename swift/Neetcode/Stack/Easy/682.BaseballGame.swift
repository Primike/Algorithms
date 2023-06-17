//An integer x. Record a new score of x.
//'+'. Record a new score that is the sum of the previous two scores.
//'D'. Record a new score that is the double of the previous score.
//'C'. Invalidate the previous score, removing it from the record.
//Return the sum of all the scores on the record after applying all the operations.

func calPoints(_ operations: [String]) -> Int {
    var stack = [Int]()

    for operation in operations {
        if operation == "+" {
            stack.append(stack[stack.count - 2] + stack[stack.count - 1])
        } else if operation == "D" {
            stack.append((stack.last ?? 0) * 2)
        } else if operation == "C" {
            stack.removeLast()
        } else if let number = Int(operation) {
            stack.append(number)
        }
    }

    return stack.reduce(0, +)
}

print(calPoints(["5","2","C","D","+"]))
print(calPoints(["5","-2","4","C","D","9","+","+"]))
print(calPoints(["1","C"]))