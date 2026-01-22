class Solution {
    func maximizeSquareHoleArea(_ n: Int, _ m: Int, _ hBars: [Int], _ vBars: [Int]) -> Int {
        let sortedHBars = hBars.sorted()
        let sortedVBars = vBars.sorted()
        
        var hMax = 1
        var vMax = 1
        var hCur = 1
        var vCur = 1
        
        if sortedHBars.count > 1 {
            for i in 1..<sortedHBars.count {
                if sortedHBars[i] == sortedHBars[i - 1] + 1 {
                    hCur += 1
                } else {
                    hCur = 1
                }
                hMax = max(hMax, hCur)
            }
        } else if sortedHBars.count == 1 {
            hMax = 1
        }
        
        if sortedVBars.count > 1 {
            for i in 1..<sortedVBars.count {
                if sortedVBars[i] == sortedVBars[i - 1] + 1 {
                    vCur += 1
                } else {
                    vCur = 1
                }
                vMax = max(vMax, vCur)
            }
        } else if sortedVBars.count == 1 {
            vMax = 1
        }
        
        let side = min(hMax, vMax) + 1
        return side * side
    }
}