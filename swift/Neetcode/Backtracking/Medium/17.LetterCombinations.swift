// Given a string containing digits from 2-9 inclusive, 
// return all possible letter combinations that the number could represent. 
// Return the answer in any order.

func letterCombinations(_ digits: String) -> [String] {
    let phone: [Character: String] = [
        "2": "abc", "3": "def", "4": "ghi", "5": "jkl", 
        "6": "mno", "7": "pqrs", "8": "tuv", "9": "wxyz"
    ]

    let digits = Array(digits)
    var result = [String]()

    func backtrack(_ n: Int, _ string: String) {
        if n == digits.count {
            if !string.isEmpty { result.append(string) }
            return
        }
        
        for letter in phone[digits[n]]! {
            backtrack(n + 1, string + String(letter))
        }
    }

    backtrack(0, "")
    return result
}

print(letterCombinations("23"))
print(letterCombinations(""))
print(letterCombinations("2"))