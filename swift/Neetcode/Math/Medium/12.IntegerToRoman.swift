// Given an integer, convert it to a roman numeral.

func intToRoman(_ num: Int) -> String {
    let numberSymbols = [
        (1000, "M"), (900, "CM"), (500, "D"), (400, "CD"),
        (100, "C"), (90, "XC"), (50, "L"), (40, "XL"),
        (10, "X"), (9, "IX"), (5, "V"), (4, "IV"), (1, "I")]

    var num = num
    var result = ""

    for (number, symbol) in numberSymbols {
        while num >= number {
            result += symbol
            num -= number
        }
    }

    return result
}

print(intToRoman(3))
print(intToRoman(58))
print(intToRoman(1994))