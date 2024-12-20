// You are given two strings start and target, both of length n. 
// Each string consists only of the characters 'L', 'R', and '_' where:
// The characters 'L' and 'R' represent pieces, where a piece 
// 'L' can move to the left only if there is a blank space directly 
// to its left, and a piece 'R' can move to the right only 
// if there is a blank space directly to its right.
// The character '_' represents a blank space that can be occupied 
// by any of the 'L' or 'R' pieces.
// Return true if it is possible to obtain the string target 
// by moving the pieces of the string start any number of times. 
// Otherwise, return false.

func canChange(_ start: String, _ target: String) -> Bool {
    var startQueue: [(Character, Int)] = []
    var targetQueue: [(Character, Int)] = []
    
    let startArray = Array(start)
    let targetArray = Array(target)

    for i in 0..<startArray.count {
        if startArray[i] != "_" {
            startQueue.append((startArray[i], i))
        }
        if targetArray[i] != "_" {
            targetQueue.append((targetArray[i], i))
        }
    }

    if startQueue.count != targetQueue.count {
        return false
    }

    for i in 0..<startQueue.count {
        let (startChar, startIndex) = startQueue[i]
        let (targetChar, targetIndex) = targetQueue[i]

        if startChar != targetChar ||
            (startChar == "L" && startIndex < targetIndex) ||
            (startChar == "R" && startIndex > targetIndex) {
            return false
        }
    }

    return true
}

print(canChange("_L__R__R_", "L______RR"))
print(canChange("R_L_", "__LR"))
print(canChange("_R", "R_"))