struct Exam: Comparable {
    let passes: Int
    let students: Int
    let gain: Double

    static func < (_ l: Exam, _ r: Exam) -> Bool {
        return l.gain < r.gain
    }
}

func maxAverageRatio(_ classes: [[Int]], _ extraStudents: Int) -> Double {
    func calculateGain(passes: Int, students: Int) -> Double {
        return Double(passes + 1) / Double(students + 1) - Double(passes) / Double(students)
    }

    var heap = Heap<Exam>(.maxHeap)

    for exam in classes {
        let pass = exam[0], students = exam[1]
        let gain = Double(pass + 1) / Double(students + 1) - Double(pass) / Double(students)
        heap.push(Exam(passes: pass, students: students, gain: gain))
    }

    for _ in 0..<extraStudents {
        guard let best = heap.pop() else { break }

        let pass = best.passes + 1, students = best.students + 1
        let newGain = Double(pass + 1) / Double(students + 1) - Double(pass) / Double(students)
        heap.push(Exam(passes: pass, students: students, gain: newGain))
    }

    var ratio = 0.0

    while let best = heap.pop() {
        ratio += Double(best.passes) / Double(best.students)
    }

    return ratio / Double(classes.count)
}