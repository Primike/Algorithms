class Solution {
    func minmaxGasDist(_ stations: [Int], _ K: Int) -> Double {
        var lo: Double = 0
        var hi: Double = 1e8

        while hi - lo > 1e-6 {
            let mi = (lo + hi) / 2.0
            if possible(mi, stations, K) {
                hi = mi
            } else {
                lo = mi
            }
        }
        return lo
    }

    private func possible(_ D: Double, _ stations: [Int], _ K: Int) -> Bool {
        var used = 0
        for i in 0..<(stations.count - 1) {
            used += Int(Double(stations[i+1] - stations[i]) / D)
        }
        return used <= K
    }
}