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

// Time: O(n), Space: O(n)
func canChange(_ start: String, _ target: String) -> Bool {
    let start = Array(start), target = Array(target)
    var queue = [(Int, Character)]()

    for i in 0..<start.count {
        if start[i] == "_" { continue }
        queue.append((i, start[i]))
    }

    var i = 0
    
    for j in 0..<target.count {
        if target[j] == "_" { continue }

        if target[j] == "L" {
            if i < queue.count, queue[i].0 >= j, queue[i].1 == "L" {
                i += 1
            } else {
                return false
            }
        } else if target[j] == "R" {
            if i < queue.count, queue[i].0 <= j, queue[i].1 == "R" {
                i += 1
            } else {
                return false
            }
        }
    }

    return i == queue.count
}

print(canChange("_L__R__R_", "L______RR"))
print(canChange("R_L_", "__LR"))
print(canChange("_R", "R_"))