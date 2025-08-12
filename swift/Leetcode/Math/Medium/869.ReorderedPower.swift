// You are given an integer n. We reorder the digits in any order 
// (including the original order) such that the leading digit is not zero.
// Return true if and only if we can do this so that the 
// resulting number is a power of two.

func reorderedPowerOf2(_ n: Int) -> Bool {
    var dict = [Int: Int]()
    var current = n

    while current > 0 {
        dict[current % 10, default: 0] += 1
        current /= 10
    }

    var values = [(Int, Int)]()

    for (key, value) in dict {
        values.append((key, value))
    }

    values.sort { $0.0 > $1.0 }
    var upperBound = 0

    for (number, count) in values {
        var x = count

        while x > 0 {
            upperBound *= 10
            upperBound += number
            x -= 1
        }
    }

    var power = 0

    while Int(pow(2.0, Double(power))) <= upperBound {
        var number = Int(pow(2.0, Double(power)))
        var dict2 = [Int: Int]()

        while number > 0 {
            dict2[number % 10, default: 0] += 1
            number /= 10
        }

        if dict2 == dict { return true }
        power += 1
    }

    return false
}

print(reorderedPowerOf2(1))
print(reorderedPowerOf2(10))