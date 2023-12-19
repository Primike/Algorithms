// Design a parking system for a parking lot. 
// The parking lot has three kinds of parking spaces: big, medium, 
// and small, with a fixed number of slots for each size.

class ParkingSystem {
    
    private var slots: [Int]
    private var capacity: [Int]

    init(_ big: Int, _ medium: Int, _ small: Int) {
        capacity = [big, medium, small]
        slots = [big, medium, small]
    }
    
    func addCar(_ carType: Int) -> Bool {
        guard carType >= 1, carType <= 3 else {
            return false
        }

        if slots[carType - 1] > 0 {
            slots[carType - 1] -= 1
            return true
        } else {
            return false
        }
    }
}
