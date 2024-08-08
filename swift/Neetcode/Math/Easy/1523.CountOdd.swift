// Given two non-negative integers low and high. 
// Return the count of odd numbers between low and high (inclusive).

// Time: O(1), Space: O(1)
func countOdds(_ low: Int, _ high: Int) -> Int {
    return (high + 1) / 2 - low / 2
}

print(countOdds(3, 7))
print(countOdds(8, 10))


func countOdds2(_ low: Int, _ high: Int) -> Int {
    if low == high { return low % 2 == 0 ? 0 : 1 }
    
    var result = (high - low) / 2

    if low % 2 != 0, high % 2 != 0, result > 0 { result -= 1 }  

    result += low % 2 == 0 ? 0 : 1
    result += high % 2 == 0 ? 0 : 1

    return result
}