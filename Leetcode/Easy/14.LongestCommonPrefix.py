# Write a function to find the longest common prefix string 
# amongst an array of strings.

# If there is no common prefix, return an empty string "".

def longestCommonPrefix(array):
    word = array[0]

    for i in array:
        for j in range(len(word)):
            if j < len(word) and j < len(i):
                if word[j] == i[j]:
                    continue
                else:
                    word = word[0 : j]

    return word

print(longestCommonPrefix(["flower","flow","flight"]))