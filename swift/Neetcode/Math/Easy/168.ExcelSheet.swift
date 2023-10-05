// Given an integer columnNumber, return its corresponding column title 
// as it appears in an Excel sheet.

func convertToTitle(_ columnNumber: Int) -> String {
    var n = columnNumber
    var result = ""
    
    while n > 0 {
        n -= 1
        let remainder = n % 26
        result = String(Character(UnicodeScalar(65 + remainder)!)) + result
        n /= 26
    }
    
    return result
}

print(convertToTitle(1))
print(convertToTitle(28))
print(convertToTitle(701))