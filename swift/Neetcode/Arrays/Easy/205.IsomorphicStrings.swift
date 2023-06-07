//Given two strings s and t, determine if they are isomorphic.
//Two strings s and t are isomorphic 
//if the characters in s can be replaced to get t.

func isIsomorphic(_ s: String, _ t: String) -> Bool {
    //a letter of a String is a Character
    //Characters can only have 1 element
    var sDict = [Character: Character]()
    var tDict = [Character: Character]()

    //using subscripts returns a Character Type
    //i and j are characters
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