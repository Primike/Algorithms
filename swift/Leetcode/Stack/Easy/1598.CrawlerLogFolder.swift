// "../" : Move to the parent folder of the current folder. 
// (If you are already in the main folder, remain in the same folder).
// "./" : Remain in the same folder.
// "x/" : Move to the child folder named x (This folder is guaranteed to always exist).
// Return the minimum number of operations needed 
// to go back to the main folder after the change folder operations.

// Time: O(n), Space: O(1)
func minOperations(_ logs: [String]) -> Int {
    var result = 0

    for log in logs {
        if log == "../" {
            result -= 1
        } else if log != "./" {
            result += 1
        }

        result = max(0, result)
    }

    return result
}

print(minOperations(["d1/","d2/","../","d21/","./"]))
print(minOperations(["d1/","d2/","./","d3/","../","d31/"]))
print(minOperations(["d1/","../","../","../"]))