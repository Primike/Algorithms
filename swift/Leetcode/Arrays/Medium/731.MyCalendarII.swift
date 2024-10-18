class MyCalendarTwo {

    private var bookings: [(Int, Int)]
    private var overlapBookings: [(Int, Int)]

    init() {
        bookings = []
        overlapBookings = []
    }

    func book(_ start: Int, _ end: Int) -> Bool {
        for booking in overlapBookings {
            if doesOverlap(booking.0, booking.1, start, end) {
                return false
            }
        }

        for booking in bookings {
            if doesOverlap(booking.0, booking.1, start, end) {
                overlapBookings.append(getOverlapped(booking.0, booking.1, start, end))
            }
        }

        bookings.append((start, end))
        return true
    }

    private func doesOverlap(_ l1: Int, _ r1: Int, _ l2: Int, _ r2: Int) -> Bool {
        return max(l1, l2) < min(r1, r2)
    }

    private func getOverlapped(_ l1: Int, _ r1: Int, _ l2: Int, _ r2: Int) -> (Int, Int) {
        return (max(l1, l2), min(r1, r2))
    }
}