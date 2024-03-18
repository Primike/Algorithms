// Given a time represented in the format "HH:MM", 
// form the next closest time by reusing the current digits. 
// There is no limit on how many times a digit can be reused.

// Time: O(4^4), Space: O(4)
func nextClosestTime(_ time: String) -> String {
    func formatToMinutes(_ time: [Character]) -> Int {
        print(time)
        let hours = String(time[0...1])
        let minutes = String(time[2...])

        return (Int(hours) ?? 0) * 60 + (Int(minutes) ?? 0)
    }

    let target = formatToMinutes(Array(time.components(separatedBy: ":").joined()))
    let numbers = Set(Array(time).filter { $0.isNumber })
    var closest = 9999
    var result = [Character]()

    func backtrack(_ current: [Character]) {
        if current.count == 4 { 
            let minutes = formatToMinutes(current)
            if minutes == target { return }

            var smallest = minutes + 1440 - target

            if minutes > target { smallest = minutes - target }

            if smallest < closest {
                closest = smallest
                result = current
            }

            return
        }

        for number in numbers {
            let num = Int(String(number)) ?? 0

            if current.count == 0, num > 2 { continue }
            if current.count == 1, current[0] == "2", num > 3 { continue }
            if current.count == 2, num > 5 { continue }

            backtrack(current + [number])
        }
    }

    backtrack([])
    if result.isEmpty { return time }
    return String(result[0...1]) + ":" + String(result[2...])
}

print(nextClosestTime("19:34"))
print(nextClosestTime("23:59"))