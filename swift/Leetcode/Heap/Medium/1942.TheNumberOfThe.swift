struct Chair: Comparable {
    let chair: Int
    let time: Int

    static func < (_ l: Chair, _ r: Chair) -> Bool {
        if l.time == r.time { return l.chair < r.chair }
        return l.time < r.time
    }
}

func smallestChair(_ times: [[Int]], _ targetFriend: Int) -> Int {
    let timesTriplets = times.enumerated().map { (index, time) in
        (time[0], time[1], index)
    }.sorted { $0.0 < $1.0 } 
    var chairsHeap = Heap<Int>(.minHeap, Array(0..<times.count))
    var timeHeap = Heap<Chair>(.minHeap)

    for (start, end, i) in timesTriplets {            
        while let first = timeHeap.peek(), first.time <= start {
            chairsHeap.push(first.chair)
            timeHeap.pop()
        }
        
        let chair = chairsHeap.pop()!  
        if i == targetFriend { return chair }
        
        timeHeap.push(Chair(chair: chair, time: end))
    }
    
    return -1 
}