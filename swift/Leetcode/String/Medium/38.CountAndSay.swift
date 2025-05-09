// The count-and-say sequence is a sequence of digit strings 
// defined by the recursive formula:
// countAndSay(1) = "1"
// countAndSay(n) is the run-length encoding of countAndSay(n - 1).
// Run-length encoding (RLE) is a string compression method 
// that works by replacing consecutive identical characters 
// (repeated 2 or more times) with the concatenation 
// of the character and the number marking the count of the characters 
// (length of the run). For example, to compress the string "3322251" 
// we replace "33" with "23", replace "222" with "32", 
// replace "5" with "15" and replace "1" with "11".
// Thus the compressed string becomes "23321511".
// Given a positive integer n, 
// return the nth element of the count-and-say sequence.

// Time: O(n), Space: O(n)
func countAndSay(_ n: Int) -> String {
    var result = ["1"] 

    for _ in 1..<n {
        var encoding = [String]() 
        var i = 0

        while i < result.count {
            let number = result[i]
            var count = 0

            while i < result.count, result[i] == number {
                count += 1
                i += 1
            }

            encoding += [String(count), number]
        }

        result = encoding
    }

    return result.joined()
}

print(countAndSay(4))
print(countAndSay(1))