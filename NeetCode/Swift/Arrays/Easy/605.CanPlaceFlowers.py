#Given an integer array flowerbed containing 0's and 1's, 
#where 0 means empty and 1 means not empty, and an integer n, 
#return if n new flowers can be planted in the flowerbed 
#without violating the no-adjacent-flowers rule.


def canPlaceFlowers(flowerbed, n):
    flowerbed = [0] + flowerbed + [0]        
    for i in range(1, len(flowerbed) - 1):
        if flowerbed[i - 1] == 0 and flowerbed[i + 1] == 0 and flowerbed[i] == 0:
            flowerbed[i] = 1
            n -= 1

    return True if n <= 0 else False

print(canPlaceFlowers([1,0,0,0,1], 1))
print(canPlaceFlowers([1,0,0,0,1], 2))