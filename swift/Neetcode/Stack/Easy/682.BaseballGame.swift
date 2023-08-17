//An integer x. Record a new score of x.
//'+'. Record a new score that is the sum of the previous two scores.
//'D'. Record a new score that is the double of the previous score.
//'C'. Invalidate the previous score, removing it from the record.
//Return the sum of all the scores on the record after applying all the operations.

func calPoints(_ operations: [String]) -> Int {
    var result = [Int]()
    var currentSum = 0

    for operation in operations {
        if let number = Int(operation) {
            result.append(number)
            currentSum += number
        } else if operation == "C", let last = result.popLast() {
            currentSum -= last
        } else if operation == "D", let last = result.last {
            let doubled = last * 2
            result.append(doubled)
            currentSum += doubled
        } else if operation == "+" {
            if result.count >= 2 {
                let sum = result[result.count - 1] + result[result.count - 2]
                result.append(sum)
                currentSum += sum
            }
        }
    }

    return currentSum
}

print(calPoints(["5","2","C","D","+"]))
print(calPoints(["5","-2","4","C","D","9","+","+"]))
print(calPoints(["1","C"]))