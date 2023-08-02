// Design a HashMap without using any built-in hash table libraries.

class MyHashMap {

    private var keys: [Int?]

    init() {
        keys = Array(repeating: nil, count: 1000001)
    }
    
    func put(_ key: Int, _ value: Int) {
        keys[key] = value
    }
    
    func get(_ key: Int) -> Int {
        return keys[key] ?? -1
    }
    
    func remove(_ key: Int) {
        keys[key] = nil
    }
}
