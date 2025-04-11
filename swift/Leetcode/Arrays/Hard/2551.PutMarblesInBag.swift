func putMarbles(_ weights: [Int], _ k: Int) -> Int {
    let n = weights.count
    var pairWeights = (0..<n-1).map { weights[$0] + weights[$0 + 1] }
    pairWeights.sort()
    var answer = 0
    for i in 0..<k-1 {
        answer += pairWeights[n - 2 - i] - pairWeights[i]
    }
    return answer
}