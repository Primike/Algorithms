// Koko loves to eat bananas. There are n piles of bananas, 
// the ith pile has piles[i] bananas. 
// The guards have gone and will come back in h hours.
// Return the minimum integer k such that she can eat all 
// the bananas within h hours.

func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
    var left = 1, right = piles.reduce(0, +) 

    while left <= right {
        let bananas = (right + left) / 2
        var hours = 0

        for pile in piles {
            hours += (pile + bananas - 1) / bananas
        }

        if hours > h {
            left = bananas + 1
        } else {
            right = bananas - 1
        }
    }

    return left
}

print(minEatingSpeed([3,6,7,11], 8))
print(minEatingSpeed([30,11,23,4,20], 5))
print(minEatingSpeed([30,11,23,4,20], 6))