class Solution {
    func cleanRoom(_ robot: Robot) {
        var visited = Set<[Int]>()
        let directions = [[-1, 0], [0, 1], [1, 0], [0, -1]]

        func goBack() {
            robot.turnRight()
            robot.turnRight()
            robot.move()
            robot.turnRight()
            robot.turnRight()
        }

        func backtrack(_ r: Int, _ c: Int, _ d: Int) {
            visited.insert([r, c])
            robot.clean()

            for i in 0..<4 {
                let newD = (d + i) % 4
                let newR = r + directions[newD][0]
                let newC = c + directions[newD][1]

                if !visited.contains([newR, newC]) && robot.move() {
                    backtrack(newR, newC, newD)
                    goBack()
                }
                robot.turnRight()
            }
        }

        backtrack(0, 0, 0)
    }
}