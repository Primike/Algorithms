class MyCalendar {

    private var calendar: [(Int, Int)]

    init() {
        self.calendar = []
    }

    func book(_ start: Int, _ end: Int) -> Bool {
        for (s, e) in calendar {
            if s < end, start < e { return false }
        }

        calendar.append((start, end))
        return true
    }
}