
func minOperations(_ boxes: String) -> [Int] {
    let n = boxes.count
    var answer = [Int](repeating: 0, count: n)
    var ballsToLeft = 0
    var movesToLeft = 0
    var ballsToRight = 0
    var movesToRight = 0
    let boxArray = Array(boxes)

    for i in 0..<n {
        answer[i] += movesToLeft
        ballsToLeft += boxArray[i].wholeNumberValue ?? 0
        movesToLeft += ballsToLeft

        let j = n - 1 - i
        answer[j] += movesToRight
        ballsToRight += boxArray[j].wholeNumberValue ?? 0
        movesToRight += ballsToRight
    }

    return answer
}