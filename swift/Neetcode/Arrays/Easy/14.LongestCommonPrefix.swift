//Write a function to find the longest common prefix string 
//amongst an array of strings.
//If there is no common prefix, return an empty string "".

func longestCommonPrefix(_ strs: [String]) -> String {
    var result = ""

    for i in 0..<strs[0].count {
        var substring = strs[0].prefix(i + 1)

        for word in strs {
            if !word.hasPrefix(substring) { return result }
        }

        result = String(substring)
    }

    return result
}
    
print(longestCommonPrefix(["flower","flow","flight"]))
print(longestCommonPrefix(["dog","racecar","car"]))