// The event can be represented as a pair of integers startTime and 
// endTime that represents a booking on the half-open interval 
// [startTime, endTime), the range of real numbers x such that startTime <= x < endTime.
// Implement the MyCalendarTwo class:
// MyCalendarTwo() Initializes the calendar object.
// boolean book(int startTime, int endTime) Returns true if
// the event can be added to the calendar successfully 
// without causing a triple booking. Otherwise, 
// return false and do not add the event to the calendar.

class MyCalendarTwo {

    private var singleBookings: [(Int, Int)]
    private var doubleBookings: [(Int, Int)]

    init() {
        singleBookings = []
        doubleBookings = []
    }

    func book(_ start: Int, _ end: Int) -> Bool {
        for (l, r) in doubleBookings {
            if max(start, l) < min(end, r) { return false }
        }

        for (l, r) in singleBookings {
            if max(start, l) < min(end, r) {
                doubleBookings.append((max(start, l), min(end, r)))
            }
        }

        singleBookings.append((start, end))
        return true
    }
}