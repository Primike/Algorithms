class Robot {
    
    private let directionNames = [0: "East", 1: "North", 2: "West", 3: "South"]
    private var moved = false
    private var index = 0
    private var positions: [(Int, Int)] = []
    private var movementDirections: [Int] = []

    init(_ width: Int, _ height: Int) {
        for i in 0..<width {
            positions.append((i, 0))
            movementDirections.append(0)
        }
        for i in 1..<height {
            positions.append((width - 1, i))
            movementDirections.append(1)
        }
        for i in stride(from: width - 2, through: 0, by: -1) {
            positions.append((i, height - 1))
            movementDirections.append(2)
        }
        for i in stride(from: height - 2, through: 1, by: -1) {
            positions.append((0, i))
            movementDirections.append(3)
        }

        if !movementDirections.isEmpty {
            movementDirections[0] = 3
        }
    }

    func step(_ num: Int) {
        moved = true
        index = (index + num) % positions.count
    }

    func getPos() -> [Int] {
        let p = positions[index]
        return [p.0, p.1]
    }

    func getDir() -> String {
        if !moved {
            return "East"
        }
        return directionNames[movementDirections[index]] ?? ""
    }
}