// Design a HashSet without using any built-in hash table libraries.

class MyHashSet {

    private var bucketArray: [Bool]
    
    init() {
        bucketArray = Array(repeating: false, count: 1000001)
    }
    
    func add(_ key: Int) {
        bucketArray[key] = true
    }
    
    func remove(_ key: Int) {
        bucketArray[key] = false
    }
    
    func contains(_ key: Int) -> Bool {
        return bucketArray[key]
    }
}
