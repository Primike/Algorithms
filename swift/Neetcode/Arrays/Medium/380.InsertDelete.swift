class RandomizedSet {

    var storedDict: [Int: Int]
    var valuesArray: [Int]
    
    init() {
        self.storedDict = [:]
        self.valuesArray = []
    }
    
    func insert(_ val: Int) -> Bool {
        if storedDict.keys.contains(val) { return false }

        storedDict[val] = valuesArray.count
        valuesArray.append(val)
        return true
    }
    
    func remove(_ val: Int) -> Bool {
        guard let index = storedDict[val] else { return false }

        valuesArray.swapAt(index, valuesArray.count - 1)
        storedDict[valuesArray[index]] = index

        valuesArray.popLast()
        storedDict[val] = nil
        return true
    }
    
    func getRandom() -> Int {
        let random = Int.random(in: 0..<valuesArray.count) 
        return valuesArray[random]
    }
}