//We are given an array asteroids of integers representing asteroids in a row.
//Find out the state of the asteroids after all collisions. 
//If two asteroids meet, the smaller one will explode. 
//If both are the same size, both will explode. 
//Two asteroids moving in the same direction will never meet.

func asteroidCollision(_ asteroids: [Int]) -> [Int] {
    var stack = [Int]()
    
    for asteroid in asteroids {
        var newAsteroid = asteroid
        
        while let last = stack.last, newAsteroid < 0, last > 0 {
            let difference = newAsteroid + last
            
            if difference < 0 {
                stack.removeLast()
            } else if difference > 0 {
                newAsteroid = 0
            } else {
                newAsteroid = 0
                stack.removeLast()
            }
        }
        
        if newAsteroid != 0 {
            stack.append(newAsteroid)
        }
    }
    
    return stack
}

print(asteroidCollision([5,10,-5]))
print(asteroidCollision([8,-8]))
print(asteroidCollision([10,2,-5]))