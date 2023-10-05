// Given two non-negative integers low and high. 
// Return the count of odd numbers between low and high (inclusive).

func countOdds(_ low: Int, _ high: Int) -> Int {
    return (high + 1) / 2 - low / 2
}

print(countOdds(3, 7))
print(countOdds(8, 10))