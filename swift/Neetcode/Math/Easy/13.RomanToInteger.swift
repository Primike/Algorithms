// Given a roman numeral, convert it to an integer.

func romanToInt(_ s: String) -> Int {
    let romanMap: [Character: Int] = [
        "I": 1, "V": 5, "X": 10, "L": 50, 
        "C": 100, "D": 500, "M": 1000]

    let s = Array(s).reversed()
    var result = 0
    var previous = 0

    for numeral in s {
        if let value = romanMap[numeral] {
            if value < previous {
                result -= value
            } else {
                result += value
            }
            previous = value
        }
    }

    return result
}

print(romanToInt("III"))
print(romanToInt("LVIII"))
print(romanToInt("MCMXCIV"))