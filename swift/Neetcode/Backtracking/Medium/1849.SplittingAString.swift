// Check if we can split s into two or more non-empty substrings such that the 
// numerical values of the substrings are in descending order and the difference 
// between numerical values of every two adjacent substrings is equal to 1.

func splitString(_ s: String) -> Bool {
    var s = Array(s)
    
    func backtrack(_ index: Int, _ lastNumber: Int64, _ count: Int) -> Bool {
        if index == s.count, count >= 2 { return true }

        var current = ""

        for i in index..<s.count {
            current += String(s[i])
            guard let number = Int64(current) else { continue }

            if index != 0, number != lastNumber - 1 { continue }
            if backtrack(i + 1, number, count + 1) { return true }
        }

        return false
    }

    return backtrack(0, .max, 0)
}

print(splitString("1234"))
print(splitString("050043"))
print(splitString("9080701"))