// Given an integer array flowerbed containing 0's and 1's, 
// where 0 means empty and 1 means not empty, and an integer n, 
// return if n new flowers can be planted in the flowerbed 
// without violating the no-adjacent-flowers rule.

func canPlaceFlowers(_ flowerbed: [Int], _ n: Int) -> Bool {
    var flowerbed = [0] + flowerbed + [0]
    var result = 0

    for i in 1..<flowerbed.count - 1 {
        if flowerbed[i] == 0, flowerbed[i - 1] == 0, flowerbed[i + 1] == 0 {
            flowerbed[i] = 1
            result += 1
        }
    }

    return result >= n
}

print(canPlaceFlowers([1,0,0,0,1], 1))
print(canPlaceFlowers([1,0,0,0,1], 2))