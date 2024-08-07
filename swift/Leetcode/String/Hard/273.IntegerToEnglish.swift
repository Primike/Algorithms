// Convert a non-negative integer num to its English words representation.

func numberToWords(_ num: Int) -> String {
    if num == 0 { return "Zero" }

    let ones = ["", "One", "Two", "Three", "Four", "Five", "Six", "Seven", 
        "Eight", "Nine", "Ten", "Eleven", "Twelve", "Thirteen", "Fourteen", 
        "Fifteen", "Sixteen", "Seventeen", "Eighteen", "Nineteen"]
    let tens = ["", "", "Twenty", "Thirty", "Forty", "Fifty", 
        "Sixty", "Seventy", "Eighty", "Ninety"]
    let thousands = ["", "Thousand", "Million", "Billion"]

    func threeDigits(_ num: Int) -> String {
        var result = ""
        var part = num

        if part >= 100 {
            result += ones[part / 100] + " Hundred "
            part %= 100
        }

        if part >= 20 {
            result += tens[part / 10] + " "
            part %= 10
        }

        if part > 0 { result += ones[part] + " " }

        return result
    }

    var result = ""
    var num = num
    var i = 0

    while num > 0 {
        if num % 1000 != 0 {
            let string = threeDigits(num % 1000) + thousands[i] + " "
            result = string + result
        }

        num /= 1000
        i += 1
    }

    return result.trimmingCharacters(in: .whitespacesAndNewlines)
}

print(numberToWords(123))
print(numberToWords(12345))
print(numberToWords(1234567))