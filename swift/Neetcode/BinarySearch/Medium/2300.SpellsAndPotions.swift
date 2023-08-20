// You are given two positive integer arrays spells and potions, 
// of length n and m respectively, where spells[i] represents the strength 
// of the ith spell and potions[j] represents the strength of the jth potion.
// Return an integer array pairs of length n where pairs[i] is the number 
// of potions that will form a successful pair with the ith spell.

func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
    let potions = potions.sorted()
    var result = [Int]()

    for spell in spells {
        var left = 0, right = potions.count - 1

        while left < right {
            let mid = (right + left) / 2

            if spell * potions[mid] < success {
                left = mid + 1
            } else {
                right = mid
            }
        }

        if left < potions.count, spell * potions[left] < success {
            left += 1
        }

        result.append(potions.count - left)
    }

    return result
}

print(successfulPairs([5,1,3], [1,2,3,4,5], 7))
print(successfulPairs([3,1,2], [8,5,8], 16))