//Given an array of strings strs, group the anagrams together. 
//You can return the answer in any order.

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var result = [String: [String]]()

    for string in strs {
        var count = Array(repeating: 0, count: 26)

        for letter in string {
            let index = Int(letter.unicodeScalars.first!.value) - Int(Unicode.Scalar("a").value)
            count[index] += 1
        }

        //comma to avoid 112 11,2 1,12
        let key = count.map { String($0) }.joined(separator: ",")
        result[key, default: []].append(string)
    }

    return Array(result.values)
}

print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))