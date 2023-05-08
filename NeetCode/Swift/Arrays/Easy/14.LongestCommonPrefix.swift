//Write a function to find the longest common prefix string 
//amongst an array of strings.
//If there is no common prefix, return an empty string "".

func longestCommonPrefix(_ strs: [String]) -> String {
    
    for (i, letter) in strs[0].enumerated() {
        let index = strs[0].index(strs[0].startIndex, offsetBy: i)

        for string in strs {
            if i == string.count || string[index] != letter {
                return String(string.prefix(i))
            }
        }
    }
    
    return strs[0]
}
    
print(longestCommonPrefix(["flower","flow","flight"]))
print(longestCommonPrefix(["dog","racecar","car"]))