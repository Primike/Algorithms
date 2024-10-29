func findKthBit(_ n: Int, _ k: Int) -> String {
    let positionInSection = k & -k
    let isInInvertedPart = ((k / positionInSection) >> 1 & 1) == 1
    let originalBitIsOne = (k & 1) == 0
    
    if isInInvertedPart {
        return originalBitIsOne ? "0" : "1"
    } else {
        return originalBitIsOne ? "1" : "0"
    }
}

print(findKthBit(3, 1))
print(findKthBit(4, 11))