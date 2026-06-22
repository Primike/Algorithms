class Solution {
    struct State {
        let prev: Int
        let curr: Int
        let tight: Int
        let lead: Int
        let count: Int
        let sum: Int
    }

    func solve(_ num: Int) -> Int {
        if num < 100 {
            return 0
        }
        
        let s = String(num)
        let digits = s.compactMap { Int(String($0)) }
        let n = digits.count
        
        var currStates = [State(prev: 10, curr: 10, tight: 1, lead: 1, count: 1, sum: 0)]
        
        for pos in 0..<n {
            let limit = digits[pos]
            
            var cnt = Array(repeating: Array(repeating: Array(repeating: Array(repeating: 0, count: 11), count: 11), count: 2), count: 2)
            var sumArr = Array(repeating: Array(repeating: Array(repeating: Array(repeating: 0, count: 11), count: 11), count: 2), count: 2)
            
            for state in currStates {
                let maxDigit = state.tight == 1 ? limit : 9
                
                for digit in 0...maxDigit {
                    let newLead = (state.lead == 1 && digit == 0) ? 1 : 0
                    let newPrev = state.curr
                    let newCurr = newLead == 1 ? 10 : digit
                    let newTight = (state.tight == 1 && digit == maxDigit) ? 1 : 0
                    
                    var add = 0
                    if newLead == 0 && state.prev != 10 && state.curr != 10 {
                        if (state.prev < state.curr && state.curr > digit) || 
                           (state.prev > state.curr && state.curr < digit) {
                            add = state.count
                        }
                    }
                    
                    cnt[newTight][newLead][newPrev][newCurr] += state.count
                    sumArr[newTight][newLead][newPrev][newCurr] += (state.sum + add)
                }
            }
            
            var nextStates = [State]()
            for tight in 0..<2 {
                for lead in 0..<2 {
                    for prev in 0..<11 {
                        for cur in 0..<11 {
                            let c = cnt[tight][lead][prev][cur]
                            if c != 0 {
                                nextStates.append(State(
                                    prev: prev,
                                    curr: cur,
                                    tight: tight,
                                    lead: lead,
                                    count: c,
                                    sum: sumArr[tight][lead][prev][cur]
                                ))
                            }
                        }
                    }
                }
            }
            currStates = nextStates
        }
        
        var ans = 0
        for state in currStates {
            ans += state.sum
        }
        return ans
    }

    func totalWaviness(_ num1: Int, _ num2: Int) -> Int {
        return solve(num2) - solve(num1 - 1)
    }
}