# Given a string s that represents a DNA sequence, 
# return all the 10-letter-long sequences (substrings) that occur more than 
# once in a DNA molecule. You may return the answer in any order.

def findRepeatedDnaSequences(s):
    dna_set, result = set(), set()

    for i in range(len(s) - 9):
        substring = s[i: i + 10]
                    
        if substring in dna_set:
            result.add(substring)

        dna_set.add(substring)
        
    return list(result)

print(findRepeatedDnaSequences("AAAAACCCCCAAAAACCCCCCAAAAAGGGTTT"))
print(findRepeatedDnaSequences("AAAAAAAAAAAAA"))