class Solution {
    func countMentions(_ numberOfUsers: Int, _ events: [[String]]) -> [Int] {
        let sortedEvents = events.sorted { e1, e2 in
            let t1 = Int(e1[1]) ?? 0
            let t2 = Int(e2[1]) ?? 0
            if t1 != t2 {
                return t1 < t2
            }
            return e1[0] == "OFFLINE" && e2[0] == "MESSAGE"
        }

        var count = [Int](repeating: 0, count: numberOfUsers)
        var nextOnlineTime = [Int](repeating: 0, count: numberOfUsers)

        for event in sortedEvents {
            let curTime = Int(event[1]) ?? 0
            if event[0] == "MESSAGE" {
                if event[2] == "ALL" {
                    for i in 0..<numberOfUsers {
                        count[i] += 1
                    }
                } else if event[2] == "HERE" {
                    for i in 0..<numberOfUsers {
                        if nextOnlineTime[i] <= curTime {
                            count[i] += 1
                        }
                    }
                } else {
                    let ids = event[2].split(separator: " ")
                    for idStr in ids {
                        if let id = Int(idStr.dropFirst(2)) {
                            count[id] += 1
                        }
                    }
                }
            } else {
                if let id = Int(event[2]) {
                    nextOnlineTime[id] = curTime + 60
                }
            }
        }

        return count
    }
}