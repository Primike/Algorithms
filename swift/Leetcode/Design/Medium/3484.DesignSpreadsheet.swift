class Spreadsheet {
    
    private var rows: Int
    private var cells: [String: Int] = [:]

    init(_ rows: Int) {
        self.rows = rows
    }

    func setCell(_ cell: String, _ value: Int) {
        cells[cell] = value
    }

    func resetCell(_ cell: String) {
        cells[cell] = nil
    }

    func getValue(_ formula: String) -> Int {
        let formulaString = String(formula.dropFirst())
        let parts = formulaString.split(separator: "+").map { String($0) }
        
        func getOperandValue(_ operand: String) -> Int {
            if let intValue = Int(operand) {
                return intValue
            }
            return cells[operand, default: 0]
        }
        
        let val1 = getOperandValue(parts[0])
        let val2 = getOperandValue(parts[1])
        return val1 + val2
    }
}