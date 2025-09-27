class Router {

    private var queue: [(source: Int, destination: Int, timestamp: Int)]
    private let maxMemory: Int
    private var destinations: [Int: Destination]

    init(_ memoryLimit: Int) {
        self.queue = []
        self.maxMemory = memoryLimit
        self.destinations = [:]
    }

    func addPacket(_ source: Int, _ destination: Int, _ timestamp: Int) -> Bool {
        let dest = destinations[destination]
        if let dest = dest, dest.contains(timestamp, source) {
            return false
        }

        if queue.count == maxMemory {
            let firstPacket = queue.removeFirst()
            if let dest1 = destinations[firstPacket.destination] {
                dest1.removePacket()
            }
        }

        var finalDest: Destination
        if let dest = dest {
            finalDest = dest
        } else {
            finalDest = Destination()
            destinations[destination] = finalDest
        }
        finalDest.addPacket(timestamp, source)

        queue.append((source, destination, timestamp))
        return true
    }

    func forwardPacket() -> [Int] {
        guard !queue.isEmpty else { return [] }

        let firstPacket = queue.removeFirst()
        if let dest1 = destinations[firstPacket.destination] {
            dest1.removePacket()
        }
        return [firstPacket.source, firstPacket.destination, firstPacket.timestamp]
    }

    func getCount(_ destination: Int, _ startTime: Int, _ endTime: Int) -> Int {
        guard let dest = destinations[destination] else { return 0 }
        return dest.getCount(startTime, endTime)
    }
}

class Destination {
    private static let MULTIPLIER = 1_000_000
    
    private var start: Int = -1
    private var end: Int = -1
    private var packets: [(timestamp: Int, source: Int)] = []
    private var packetSet: Set<Int> = []

    func addPacket(_ timestamp: Int, _ source: Int) {
        if start == -1 {
            start = 0
        }
        
        if packets.count > end + 1 {
            packets[end + 1] = (timestamp, source)
        } else {
            packets.append((timestamp, source))
        }
        end += 1

        let x = timestamp * Destination.MULTIPLIER + source
        packetSet.insert(x)
    }
    
    func removePacket() {
        let packet = packets[start]
        let x = packet.timestamp * Destination.MULTIPLIER + packet.source
        packetSet.remove(x)
        
        if start == end {
            start = -1
            end = -1
        } else {
            start += 1
        }
    }
    
    func getCount(_ startTime: Int, _ endTime: Int) -> Int {
        if start == -1 { return 0 }

        var lb = end + 1
        var ub = -1
        
        var tempStart = start
        var tempEnd = end
        
        while tempStart <= tempEnd {
            let mid = tempStart + (tempEnd - tempStart) / 2
            let x = packets[mid].timestamp

            if x >= startTime {
                lb = mid
                tempEnd = mid - 1
            } else {
                tempStart = mid + 1
            }
        }

        tempStart = start
        tempEnd = end
        while tempStart <= tempEnd {
            let mid = tempStart + (tempEnd - tempStart) / 2
            let x = packets[mid].timestamp
            
            if x <= endTime {
                ub = mid
                tempStart = mid + 1
            } else {
                tempEnd = mid - 1
            }
        }

        if lb <= ub {
            return ub - lb + 1
        }
        return 0
    }
    
    func contains(_ timestamp: Int, _ source: Int) -> Bool {
        if start == -1 { return false }
        let key = timestamp * Destination.MULTIPLIER + source
        return packetSet.contains(key)
    }
}