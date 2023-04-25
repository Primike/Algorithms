# You are given a 0-indexed string s of even length n. 
# The string consists of exactly n / 2 opening brackets '[' and n / 2 closing brackets ']'
# Return the minimum number of swaps to make s balanced.

def minSwaps(s):
    result = 0
    count = 0

    for string in s:
        if string == "]":
            count += 1
        else:
            count -= 1

        result = max(result, count)

    return (result + 1)//2

print(minSwaps("][]["))
print(minSwaps("]]][[["))
print(minSwaps("[]"))