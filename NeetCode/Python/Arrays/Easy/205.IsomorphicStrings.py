# Given two strings s and t, determine if they are isomorphic.
# Two strings s and t are isomorphic 
# if the characters in s can be replaced to get t.

def isIsomorphic(s, t):
    s_dict, t_dict = {}, {}

    for i, j in zip(s, t):
        if (i in s_dict and s_dict[i] != j) or (j in t_dict and t_dict[j] != i):
            return False

        s_dict[i] = j
        t_dict[j] = i

    return True

print(isIsomorphic("egg", "add"))
print(isIsomorphic("foo", "bar"))
print(isIsomorphic("paper", "title"))
print(isIsomorphic("badc", "baba"))