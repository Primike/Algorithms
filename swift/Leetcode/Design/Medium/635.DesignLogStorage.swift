
class LogSystem {
    private var logs: [(timestamp: Int64, id: Int)] = []
    private let indices: [String: Int] = [
        "Year": 0, "Month": 1, "Day": 2,
        "Hour": 3, "Minute": 4, "Second": 5
    ]

    init() {}

    func put(_ id: Int, _ timestamp: String) {
        let st = timestamp.split(separator: ":").compactMap { Int($0) }
        let key = convert(st)
        logs.append((key, id))
        logs.sort { $0.timestamp < $1.timestamp }
    }

    private func convert(_ st: [Int]) -> Int64 {
        var temp = st
        while temp.count < 6 { temp.append(0) }
        
        let month = Int64(max(0, temp[1] - 1))
        let day = Int64(max(0, temp[2] - 1))
        
        let yearPart = Int64(temp[0] - 1999) * (12 * 31 * 24 * 60 * 60)
        let monthPart = month * (31 * 24 * 60 * 60)
        let dayPart = day * (24 * 60 * 60)
        let hourPart = Int64(temp[3]) * (60 * 60)
        let minutePart = Int64(temp[4]) * 60
        let secondPart = Int64(temp[5])
        
        return yearPart + monthPart + dayPart + hourPart + minutePart + secondPart
    }

    func retrieve(_ s: String, _ e: String, _ gra: String) -> [Int] {
        let start = granularity(s, gra, false)
        let end = granularity(e, gra, true)
        
        var res: [Int] = []
        for log in logs {
            if log.timestamp >= start && log.timestamp < end {
                res.append(log.id)
            }
        }
        return res
    }

    private func granularity(_ s: String, _ gra: String, _ isEnd: Bool) -> Int64 {
        let idx = indices[gra] ?? 5
        let st = s.split(separator: ":").map { String($0) }
        
        var resParts = ["1999", "01", "01", "00", "00", "00"]
        for i in 0...idx {
            resParts[i] = st[i]
        }
        
        var t = resParts.compactMap { Int($0) }
        if isEnd {
            t[idx] += 1
        }
        
        return convert(t)
    }
}