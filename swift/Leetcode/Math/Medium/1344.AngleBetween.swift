class Solution {
    func angleClock(_ hour: Int, _ minutes: Int) -> Double {
        let oneMinAngle: Double = 6
        let oneHourAngle: Double = 30
        
        let minutesAngle = oneMinAngle * Double(minutes)
        let hourAngle = (Double(hour % 12) + Double(minutes) / 60.0) * oneHourAngle
        
        let diff = abs(hourAngle - minutesAngle)
        return min(diff, 360.0 - diff)
    }
}