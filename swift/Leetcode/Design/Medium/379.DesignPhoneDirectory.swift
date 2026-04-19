
class PhoneDirectory {
    
    private var slotsAvailable: Set<Int>

    init(_ maxNumbers: Int) {
        self.slotsAvailable = Set(0..<maxNumbers)
    }

    func get() -> Int {
        return slotsAvailable.popFirst() ?? -1
    }

    func check(_ number: Int) -> Bool {
        return slotsAvailable.contains(number)
    }

    func release(_ number: Int) {
        slotsAvailable.insert(number)
    }
}