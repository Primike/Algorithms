// A string s can be partitioned into groups of 
// size k using the following procedure:
// The first group consists of the first k characters of the string, 
// the second group consists of the next k characters of the string, 
// and so on. Each element can be a part of exactly one group.
// For the last group, if the string does not have k characters remaining, 
// a character fill is used to complete the group.
// Note that the partition is done so that after removing the 
// fill character from the last group (if it exists) and 
// concatenating all the groups in order, the resultant string should be s.
// Given the string s, the size of each group k and the character fill, 
// return a string array denoting the composition of every group s 
// has been divided into, using the above procedure.

// Time: O(n), Space: O(n)
func divideString(_ s: String, _ k: Int, _ fill: Character) -> [String] {
    var result = [String]()
    var string = ""
    var index = 0

    for char in s {
        string.append(char)
        index += 1

        if index == k { 
            result.append(string) 
            string = ""
            index = 0
        }
    }

    if index != 0 {
        string += String(repeating: fill, count: k - index)
        result.append(string)
    }

    return result
}

print(divideString("abcdefghi", 3, "x"))
print(divideString("abcdefghij", 3, "x"))