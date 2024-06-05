// Person 0 has a secret and initially shares the secret with a person firstPerson at time 0. 
// This secret is then shared every time a meeting takes place with a person that has the secret. 
// More formally, for every meeting, if a person xi has the secret at timei, 
// then they will share the secret with person yi, and vice versa.
// The secrets are shared instantaneously. That is, a person may receive the secret 
// and share it with people in other meetings within the same time frame.
// Return a list of all the people that have the secret after all the meetings 
// have taken place. You may return the answer in any order.

struct Person: Comparable {
    let i: Int
    let time: Int

    static func < (_ l: Person, _ r: Person) -> Bool {
        return l.time < r.time
    }
}

func findAllPeople(_ n: Int, _ meetings: [[Int]], _ firstPerson: Int) -> [Int] {
    var paths = Array(repeating: [(Int, Int)](), count: n)

    for meeting in meetings {
        paths[meeting[0]].append((meeting[1], meeting[2]))
        paths[meeting[1]].append((meeting[0], meeting[2]))
    }

    var heap = Heap<Person>(.minHeap, [Person(i: 0, time: 0), Person(i: firstPerson, time: 0)])
    var visited = Set<Int>()
    var result = [Int]()
    var time = 0

    while !heap.isEmpty {
        time = max(heap.peek()?.time ?? 0, time)

        while let first = heap.peek(), first.time == time {
            heap.pop()
            if visited.contains(first.i) { continue }

            visited.insert(first.i)
            result.append(first.i)

            for path in paths[first.i] {
                if path.1 < time || visited.contains(path.0) { continue }
                
                heap.push(Person(i: path.0, time: path.1))
            }
        }
    }

    return result
}

print(findAllPeople(6, [[1,2,5],[2,3,8],[1,5,10]], 1))
print(findAllPeople(4, [[3,1,3],[1,2,2],[0,3,3]], 3))
print(findAllPeople(5, [[3,4,2],[1,2,1],[2,3,1]], 1))