// Given two strings s and t, determine if they are isomorphic.
// Two strings s and t are isomorphic 
// if the characters in s can be replaced to get t.

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    var sDict = [Character: Character](), tDict = [Character: Character]()

    for (i, j) in zip(s, t) {
        if (sDict[i] != nil && sDict[i] != j) || (tDict[j] != nil && tDict[j] != i) {
            return false
        }

        sDict[i] = j 
        tDict[j] = i
    }

    return true
}

print(isIsomorphic("egg", "add"))
print(isIsomorphic("foo", "bar"))
print(isIsomorphic("paper", "title"))
print(isIsomorphic("badc", "baba"))