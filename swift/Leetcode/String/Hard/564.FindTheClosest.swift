// Given a string n representing an integer, return the closest 
// integer (not including itself), which is a palindrome. 
// If there is a tie, return the smaller one.
// The closest is defined as the absolute difference minimized 
// between two integers.

// Time: O(n), Space: O(n)
func nearestPalindromic(_ n: String) -> String {
    func numberToPalindrome(_ number: Int) -> Int {
        var palindrome = number
        var current = (n.count % 2 == 0) ? number : number / 10
        
        while current > 0 {
            palindrome = palindrome * 10 + current % 10
            current /= 10
        }

        return palindrome
    }

    let leftHalf = Int(n.prefix((n.count + 1) / 2))!
    var possibilities = [Int]()
    possibilities.append(numberToPalindrome(leftHalf))
    possibilities.append(numberToPalindrome(leftHalf + 1))
    possibilities.append(numberToPalindrome(leftHalf - 1))
    possibilities.append(Int(pow(10.0, Double(n.count - 1))) - 1)
    possibilities.append(Int(pow(10.0, Double(n.count))) + 1)
    
    let integerN = Int(n)!
    var result = 0
    var closest = Int.max
    
    for palindrome in possibilities {
        if palindrome == integerN { continue }

        let difference = abs(palindrome - integerN)

        if difference < closest {
            closest = difference
            result = palindrome
        } else if difference == closest {
            result = min(result, palindrome)
        }
    }

    return String(result)
}

print(nearestPalindromic("123"))
print(nearestPalindromic("1"))