class Solution {
    func largestAltitude(_ gain: [Int]) -> Int {
        var currentAltitude = 0
        var highestPoint = 0
        
        for altitudeGain in gain {
            currentAltitude += altitudeGain
            highestPoint = max(highestPoint, currentAltitude)
        }
        
        return highestPoint
    }
}