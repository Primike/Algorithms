// You are given a 0-indexed integer array candies, 
// where candies[i] represents the flavor of the ith candy. 
// Your mom wants you to share these candies with your 
// little sister by giving her k consecutive candies, 
// but you want to keep as many flavors of candies as possible.
// Return the maximum number of unique flavors of candy 
// you can keep after sharing with your sister.

func shareCandies(_ candies: [Int], _ k: Int) -> Int {
    if k == 0 { return Set(candies).count }
    
    var dict = candies.reduce(into: [:]) { $0[$1, default: 0] += 1 }
    var result = 0
    
    for (i, candy) in candies.enumerated() {
        dict[candy]! -= 1   
        if dict[candy]! == 0 { dict[candy] = nil }

        if i < k - 1 { continue }
        result = max(result, dict.keys.count)

        let left = i - k + 1
        dict[candies[left], default: 0] += 1
    }

    return result
}

print(shareCandies([1,2,2,3,4,3], 3))
print(shareCandies([2,2,2,2,3,3], 2))
print(shareCandies([2,4,5], 0))