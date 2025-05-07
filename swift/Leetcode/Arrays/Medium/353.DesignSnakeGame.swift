struct Point: Hashable {
    let row: Int
    let col: Int
}

class SnakeGame {

    var snake: [Point]
    var snakeSet: Set<Point>
    let width: Int
    let height: Int
    let food: [[Int]]
    var foodIndex: Int
    let movement: [Character: Point]

    init(_ width: Int, _ height: Int, _ food: [[Int]]) {
        self.width = width
        self.height = height
        self.food = food
        self.foodIndex = 0

        let startPoint = Point(row: 0, col: 0)
        self.snake = [startPoint]
        self.snakeSet = [startPoint]

        self.movement = [
            "U": Point(row: -1, col: 0),
            "L": Point(row: 0, col: -1),
            "R": Point(row: 0, col: 1),
            "D": Point(row: 1, col: 0)
        ]
    }

    func move(_ direction: String) -> Int {
        guard let currentHead = snake.first,
              let moveDirection = direction.first,
              let moveDelta = movement[moveDirection] else {
            return -1
        }

        let newHead = Point(row: currentHead.row + moveDelta.row,
                            col: currentHead.col + moveDelta.col)

        if newHead.row < 0 || newHead.row >= height || newHead.col < 0 || newHead.col >= width {
            return -1
        }

        var foodEaten = false
        if foodIndex < food.count {
            let nextFoodItem = food[foodIndex]
            if newHead.row == nextFoodItem[0] && newHead.col == nextFoodItem[1] {
                foodEaten = true
                foodIndex += 1
            }
        }

        let tail = snake.last 

        if !foodEaten {
            if let currentTail = tail {
                snakeSet.remove(currentTail)
            }
        }

        if snakeSet.contains(newHead) {
            return -1
        }

        snake.insert(newHead, at: 0)
        snakeSet.insert(newHead)

        if !foodEaten {
            if snake.count > 1 { 
                snake.removeLast()
            }
         }

        return snake.count - 1
    }
}