// There are n dominoes in a line, and we place each domino vertically upright. 
// In the beginning, we simultaneously push some of the dominoes either to the 
// left or to the right. Return a string representing the final state.

func pushDominoes(_ dominoes: String) -> String {
    var dominoes = Array(dominoes)
    var forces = Array(repeating: 0, count: dominoes.count)
    
    var force = 0
    // Populate forces from left to right
    for i in 0..<dominoes.count {
        if dominoes[i] == "R" {
            force = dominoes.count
        } else if dominoes[i] == "L" {
            force = 0
        } else {
            force = max(force - 1, 0)
        }
        forces[i] += force
    }
    
    force = 0
    // Populate forces from right to left
    for i in stride(from: dominoes.count - 1, through: 0, by: -1) {
        if dominoes[i] == "L" {
            force = dominoes.count
        } else if dominoes[i] == "R" {
            force = 0
        } else {
            force = max(force - 1, 0)
        }
        forces[i] -= force
    }
    
    // Convert forces to resultant state
    let result = String(forces.map { $0 > 0 ? "R" : $0 < 0 ? "L" : "." })
    
    return result
}

print(pushDominoes("RR.L"))
print(pushDominoes(".L.R...LR..L.."))