class UndergroundSystem {

    var traveling: [Int: (String, Int)]
    var travelTimes: [String: (Int, Int)]

    init() {
        self.traveling = [:]
        self.travelTimes = [:]
    }
    
    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        traveling[id] = (stationName, t)
    }
    
    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        let (startStation, startTime) = traveling[id]!
        traveling[id] = nil
        let path = "\(startStation),\(stationName)"

        let (total, count) = travelTimes[path, default: (0, 0)]
        travelTimes[path] = (total + (t - startTime), count + 1)
    }
    
    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        let (total, count) = travelTimes["\(startStation),\(endStation)"]!
        return Double(total) / Double(count)
    }
}
