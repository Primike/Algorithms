class Solution {
    func maxWalls(_ robots: [Int], _ distance: [Int], _ walls: [Int]) -> Int {
        let n = robots.count
        var robotDist = Array(zip(robots, distance))
        robotDist.sort { $0.0 < $1.0 }

        var sortedWalls = walls
        sortedWalls.sort()

        let m = sortedWalls.count
        var rightPtr = 0
        var leftPtr = 0
        var curPtr = 0
        var robotPtr = 0

        var subLeft = 0
        var subRight = 0

        var prevRight = 0

        for i in 0..<n {
            let robotPos = robotDist[i].0
            let robotDistVal = robotDist[i].1

            while rightPtr < m && sortedWalls[rightPtr] <= robotPos {
                rightPtr += 1
            }
            let pos1 = rightPtr

            while curPtr < m && sortedWalls[curPtr] < robotPos {
                curPtr += 1
            }
            let pos2 = curPtr

            let leftBound: Int
            if i >= 1 {
                leftBound = max(robotPos - robotDistVal, robotDist[i - 1].0 + 1)
            } else {
                leftBound = robotPos - robotDistVal
            }

            while leftPtr < m && sortedWalls[leftPtr] < leftBound {
                leftPtr += 1
            }
            let leftPos = leftPtr
            let currentLeft = pos1 - leftPos

            let rightBound: Int
            if i < n - 1 {
                rightBound = min(robotPos + robotDistVal, robotDist[i + 1].0 - 1)
            } else {
                rightBound = robotPos + robotDistVal
            }

            while rightPtr < m && sortedWalls[rightPtr] <= rightBound {
                rightPtr += 1
            }
            let rightPos = rightPtr
            let currentRight = rightPos - pos2

            var currentNum = 0
            if i > 0 {
                while robotPtr < m && sortedWalls[robotPtr] < robotDist[i - 1].0 {
                    robotPtr += 1
                }
                let pos3 = robotPtr
                currentNum = pos1 - pos3
            }

            if i == 0 {
                subLeft = currentLeft
                subRight = currentRight
            } else {
                let newSubLeft = max(
                    subLeft + currentLeft,
                    subRight - prevRight + min(currentLeft + prevRight, currentNum)
                )
                let newSubRight = max(
                    subLeft + currentRight,
                    subRight + currentRight
                )
                subLeft = newSubLeft
                subRight = newSubRight
            }

            prevRight = currentRight
        }

        return max(subLeft, subRight)
    }
}