// You are given an integer array digits, 
// where each element is a digit. The array may contain duplicates.
// You need to find all the unique integers 
// that follow the given requirements:
// The integer consists of the concatenation of three elements 
// from digits in any arbitrary order.
// The integer does not have leading zeros.
// The integer is even.
// For example, if the given digits were [1, 2, 3], 
// integers 132 and 312 follow the requirements.
// Return a sorted array of the unique integers.

// Time: O(999), Space: O(n)
func findEvenNumbers(_ digits: [Int]) -> [Int] {
    var dict = digits.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = [Int]()

    for i in 100...999 {
        if i % 2 != 0 { continue }
        
        let digit1 = i / 100
        let digit2 = (i / 10) % 10
        let digit3 = i % 10
        var dictCopy = dict

        if dictCopy[digit1, default: 0] == 0 { continue }
        dictCopy[digit1]! -= 1
        if dictCopy[digit2, default: 0] == 0 { continue }
        dictCopy[digit2]! -= 1
        if dictCopy[digit3, default: 0] == 0 { continue }
        dictCopy[digit3]! -= 1

        result.append(i)
    }

    return result
}

print(findEvenNumbers([2,1,3,0]))
print(findEvenNumbers([2,2,8,8,2]))
print(findEvenNumbers([3,7,5]))