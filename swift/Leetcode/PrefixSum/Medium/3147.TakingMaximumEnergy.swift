class Solution {
    func maximumEnergy(_ energy: [Int], _ k: Int) -> Int {
        let n = energy.count
        var lastK = Array(energy.suffix(k).reversed())

        for idx in stride(from: n - k - 1, through: 0, by: -1) {
            let indexToRead = lastK.count - k
            let newValue = lastK[indexToRead] + energy[idx]
            lastK.append(newValue)
        }

        return lastK.max()!
    }
}