// We are given an array asteroids of integers representing asteroids in a row.
// Find out the state of the asteroids after all collisions. 
// If two asteroids meet, the smaller one will explode. 
// If both are the same size, both will explode. 
// Two asteroids moving in the same direction will never meet.

func asteroidCollision(_ asteroids: [Int]) -> [Int] {
    var result = [Int]()

    for asteroid in asteroids {
        if result.isEmpty || asteroid > 0 {
            result.append(asteroid)
            continue
        } else if let last = result.last, last < 0 {
            result.append(asteroid)
            continue
        }
        
        while let last = result.last, last > 0, last < abs(asteroid) {
            result.removeLast()
        }

        if let last = result.last, last > 0, last == abs(asteroid) {
            result.removeLast()
        } else if let last = result.last, last > 0 {
            continue
        } else {
            result.append(asteroid)
        }
    }

    return result
}

print(asteroidCollision([5,10,-5]))
print(asteroidCollision([8,-8]))
print(asteroidCollision([10,2,-5]))