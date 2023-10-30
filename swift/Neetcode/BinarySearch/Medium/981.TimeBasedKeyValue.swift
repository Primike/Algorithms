class TimeMap {

    var dict: [String: [(Int, String)]]

    init() {
        dict = [:]
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        dict[key, default: []].append((timestamp, value))
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        var values = dict[key, default: []]
        var left = 0, right = values.count - 1

        while left <= right {
            let mid = (right + left) / 2

            if values[mid].0 > timestamp {
                right = mid - 1 
            } else if values[mid].0 < timestamp {
                left = mid + 1
            } else {
                return values[mid].1
            }
        }

        return right >= 0 ? values[right].1 : ""
    }
}