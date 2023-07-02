// Koko loves to eat bananas. There are n piles of bananas, 
// the ith pile has piles[i] bananas. 
// The guards have gone and will come back in h hours.
// Return the minimum integer k such that she can eat all 
// the bananas within h hours.

func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    var left = 1, right = piles.max() ?? 0
    var result = right

    while left <= right {
        let k = (right + left) / 2
        var time = 0
        
        for pile in piles {
            time += Int(ceil(Double(pile) / Double(k)))
        }
        
        if time <= h {
            result = min(result, k)
            right = k - 1
        } else {
            left = k + 1
        }
    }
    
    return result
}

print(minEatingSpeed([3,6,7,11], 8))
print(minEatingSpeed([30,11,23,4,20], 5))
print(minEatingSpeed([30,11,23,4,20], 6))