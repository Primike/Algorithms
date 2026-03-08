class Excel {
    private class Formula {
        var cells: [String: Int]
        var val: Int
        
        init(cells: [String: Int], val: Int) {
            self.cells = cells
            self.val = val
        }
    }
    
    private var formulas: [[Formula?]]
    private var stack: [[Int]] = []
    private let height: Int
    private let width: Int

    init(_ H: Int, _ W: Character) {
        let columnCount = Int(W.asciiValue! - Character("A").asciiValue!) + 1
        self.formulas = Array(repeating: Array(repeating: nil, count: columnCount), count: H)
        self.height = H
        self.width = columnCount
    }

    func get(_ r: Int, _ c: Character) -> Int {
        let rowIndex = r - 1
        let colIndex = Int(c.asciiValue! - Character("A").asciiValue!)
        if rowIndex < 0 || rowIndex >= height || colIndex < 0 || colIndex >= width { return 0 }
        return formulas[rowIndex][colIndex]?.val ?? 0
    }

    func set(_ r: Int, _ c: Character, _ v: Int) {
        let rowIndex = r - 1
        let colIndex = Int(c.asciiValue! - Character("A").asciiValue!)
        
        formulas[rowIndex][colIndex] = Formula(cells: [:], val: v)
        
        updateDependencies(r: rowIndex, c: colIndex)
    }

    func sum(_ r: Int, _ c: Character, _ strs: [String]) -> Int {
        let rowIndex = r - 1
        let colIndex = Int(c.asciiValue! - Character("A").asciiValue!)
        
        let cells = convert(strs)
        let summ = calculateValue(cells: cells)
        
        formulas[rowIndex][colIndex] = Formula(cells: cells, val: summ)
        
        updateDependencies(r: rowIndex, c: colIndex)
        
        return summ
    }

    private func updateDependencies(r: Int, c: Int) {
        stack.removeAll()
        var visited = Set<String>()
        
        topologicalSort(r, c, &visited)
        
        stack.removeLast()
        
        while !stack.isEmpty {
            let curr = stack.removeLast()
            let currR = curr[0]
            let currC = curr[1]
            
            if let formula = formulas[currR][currC], !formula.cells.isEmpty {
                let newValue = calculateValue(cells: formula.cells)
                formulas[currR][currC]?.val = newValue
            }
        }
    }

    private func topologicalSort(_ r: Int, _ c: Int, _ visited: inout Set<String>) {
        let cellName = "\(Character(UnicodeScalar(UInt8(65 + c))))\(r + 1)"
        
        for i in 0..<height {
            for j in 0..<width {
                if let formula = formulas[i][j], formula.cells[cellName] != nil {
                    let depName = "\(Character(UnicodeScalar(UInt8(65 + j))))\(i + 1)"
                    if !visited.contains(depName) {
                        visited.insert(depName)
                        topologicalSort(i, j, &visited)
                    }
                }
            }
        }
        stack.append([r, c])
    }

    private func convert(_ strs: [String]) -> [String: Int] {
        var res: [String: Int] = [:]
        for st in strs {
            if !st.contains(":") {
                res[st, default: 0] += 1
            } else {
                let parts = st.split(separator: ":").map { String($0) }
                let start = parts[0]
                let end = parts[1]
                
                let sj = start.first!
                let ej = end.first!
                let si = Int(start.dropFirst())!
                let ei = Int(end.dropFirst())!
                
                for i in si...ei {
                    for j_ascii in sj.asciiValue!...ej.asciiValue! {
                        let cell = "\(Character(UnicodeScalar(j_ascii)))\(i)"
                        res[cell, default: 0] += 1
                    }
                }
            }
        }
        return res
    }

    private func calculateValue(cells: [String: Int]) -> Int {
        var total = 0
        for (s, count) in cells {
            let colChar = s.first!
            let rowVal = Int(s.dropFirst())!
            let x = rowVal - 1
            let y = Int(colChar.asciiValue! - Character("A").asciiValue!)
            total += (formulas[x][y]?.val ?? 0) * count
        }
        return total
    }
}