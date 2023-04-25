#Write a function to find the longest common prefix string 
#amongst an array of strings.
#If there is no common prefix, return an empty string "".

def longestCommonPrefix(strs):
    solution = ''

    for i in range(len(strs[0])):
        for word in strs:
            if i == len(word) or strs[0][i] != word[i]:
                return solution
        solution += strs[0][i]

    return solution
    
print(longestCommonPrefix(["flower","flow","flight"]))
print(longestCommonPrefix(["dog","racecar","car"]))