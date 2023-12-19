// Given an array of strings strs, group the anagrams together. 
// You can return the answer in any order.

func groupAnagrams(_ strs: [String]) -> [[String]] {
    var dict = [String: [String]]()

    for string in strs {
        var count = Array(repeating: 0, count: 26)

        for letter in string {
            count[Int(letter.asciiValue! - 97)] += 1
        }

        let key = count.map { String($0) }.joined(separator: ",")
        dict[key, default: []].append(string)
    }

    return Array(dict.values)
}

print(groupAnagrams(["eat","tea","tan","ate","nat","bat"]))