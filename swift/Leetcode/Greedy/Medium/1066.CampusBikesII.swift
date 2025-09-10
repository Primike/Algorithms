class Solution {
    var smallestDistanceSum = Int.max
    var visited: [Bool] = []

    private func findDistance(worker: [Int], bike: [Int]) -> Int {
        return abs(worker[0] - bike[0]) + abs(worker[1] - bike[1])
    }

    private func minimumDistanceSum(workers: [[Int]], workerIndex: Int, bikes: [[Int]], currDistanceSum: Int) {
        if workerIndex >= workers.count {
            smallestDistanceSum = min(smallestDistanceSum, currDistanceSum)
            return
        }

        if currDistanceSum >= smallestDistanceSum {
            return
        }

        for bikeIndex in 0..<bikes.count {
            if !visited[bikeIndex] {
                visited[bikeIndex] = true
                minimumDistanceSum(
                    workers: workers,
                    workerIndex: workerIndex + 1,
                    bikes: bikes,
                    currDistanceSum: currDistanceSum + findDistance(worker: workers[workerIndex], bike: bikes[bikeIndex])
                )
                visited[bikeIndex] = false
            }
        }
    }

    func assignBikes(_ workers: [[Int]], _ bikes: [[Int]]) -> Int {
        self.visited = [Bool](repeating: false, count: bikes.count)
        minimumDistanceSum(workers: workers, workerIndex: 0, bikes: bikes, currDistanceSum: 0)
        return smallestDistanceSum
    }
}