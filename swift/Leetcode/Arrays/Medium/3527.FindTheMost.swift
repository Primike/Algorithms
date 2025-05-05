// You are given a 2D string array responses 
// where each responses[i] is an array of strings 
// representing survey responses from the ith day.
// Return the most common response across all days 
// after removing duplicate responses within each responses[i]. 
// If there is a tie, return the lexicographically smallest response.

// Time: O(n), Space: O(n)
func findCommonResponse(_ responses: [[String]]) -> String {
    var dict = [String: Int]()
    var result = ""
    
    for i in 0..<responses.count {
        var wordSet = Set<String>()

        for word in responses[i] {
            if wordSet.contains(word) { continue }

            wordSet.insert(word)
            dict[word, default: 0] += 1
            result = max(result, word)
        }
    }

    var maximum = dict.values.max() ?? 0

    for (key, value) in dict {
        if value == maximum, key < result { result = key }
    }

    return result
}

print(findCommonResponse([["good","ok","good","ok"],["ok","bad","good","ok","ok"],["good"],["bad"]]))
print(findCommonResponse([["good","ok","good"],["ok","bad"],["bad","notsure"],["great","good"]]))