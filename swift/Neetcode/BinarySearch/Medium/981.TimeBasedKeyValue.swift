class TimeMap {

    private var store: [String: [(String, Int)]]

    init() {
        self.store = [:]    
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        store[key, default: []].append((value, timestamp))
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        let values = store[key] ?? []
        var left = 0, right = values.count - 1

        while left <= right {
            let mid = (right + left) / 2

            if values[mid].1 > timestamp {
                right = mid - 1
            } else if values[mid].1 < timestamp {
                left = mid + 1
            } else {
                return values[mid].0
            }
        }

        return right >= 0 ? values[right].0 : ""
    }
}