// Given a string n representing an integer, return the closest 
// integer (not including itself), which is a palindrome. 
// If there is a tie, return the smaller one.
// The closest is defined as the absolute difference minimized 
// between two integers.

func nearestPalindromic(_ n: String) -> String {
    func halfToPalindrome(_ left: Int, _ isEven: Bool) -> Int {
        var result = left
        var leftCopy = isEven ? left : left / 10
        
        while leftCopy > 0 {
            result = result * 10 + leftCopy % 10
            leftCopy /= 10
        }
        
        return result
    }

    let i = n.count % 2 == 0 ? n.count / 2 - 1 : n.count / 2
    let firstHalf = Int(n.prefix(i + 1))!

    var possibilities = [Int]()
    possibilities.append(halfToPalindrome(firstHalf, n.count % 2 == 0))
    possibilities.append(halfToPalindrome(firstHalf + 1, n.count % 2 == 0))
    possibilities.append(halfToPalindrome(firstHalf - 1, n.count % 2 == 0))
    possibilities.append(Int(pow(10.0, Double(n.count - 1))) - 1)
    possibilities.append(Int(pow(10.0, Double(n.count))) + 1)
    
    var difference = Int.max
    var result = 0
    let nl = Int(n)!
    
    for cand in possibilities {
        if cand == nl { continue }

        let currentDiff = abs(cand - nl)

        if currentDiff < difference {
            difference = currentDiff
            result = cand
        } else if currentDiff == difference {
            result = min(result, cand)
        }
    }

    return String(result)
}

print(nearestPalindromic("123"))
print(nearestPalindromic("1"))