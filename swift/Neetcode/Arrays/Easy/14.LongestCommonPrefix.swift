// Write a function to find the longest common prefix string 
// amongst an array of strings.
// If there is no common prefix, return an empty string "".

func longestCommonPrefix(_ strs: [String]) -> String {
    var result = ""

    for letter in strs[0] {
        for word in strs {
            if !word.hasPrefix(result + String(letter)) { return result }
        }

        result += String(letter)
    }

    return result
}
    
print(longestCommonPrefix(["flower","flow","flight"]))
print(longestCommonPrefix(["dog","racecar","car"]))