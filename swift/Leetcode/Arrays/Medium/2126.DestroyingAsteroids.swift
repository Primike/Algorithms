class Solution {
    func asteroidsDestroyed(_ mass: Int, _ asteroids: [Int]) -> Bool {
        var sortedAsteroids = asteroids.sorted()
        var currentMass = mass
        
        for asteroid in sortedAsteroids {
            if currentMass < asteroid {
                return false
            }
            currentMass += asteroid
        }
        
        return true
    }
}