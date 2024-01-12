// Given a string containing digits from 2-9 inclusive, 
// return all possible letter combinations that the number could represent. 
// Return the answer in any order.

// Time: O(4^n), Space: O(4^n)
func letterCombinations(_ digits: String) -> [String] {
    if digits.count == 0 { return [] }

    let phone: [Character: String] = [
        "2": "abc", "3": "def", "4": "ghi", "5": "jkl", 
        "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"
    ]

    var digits = Array(digits)
    var result = [String]()

    func backtrack(_ index: Int, _ string: String) {
        if index == digits.count { 
            result.append(string) 
            return
        }

        for letter in phone[digits[index], default: ""] {
            backtrack(index + 1, string + String(letter))
        }
    }

    backtrack(0, "")
    return result
}

print(letterCombinations("23"))
print(letterCombinations(""))
print(letterCombinations("2"))