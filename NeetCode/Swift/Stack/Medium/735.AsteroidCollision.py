# We are given an array asteroids of integers representing asteroids in a row.
# Find out the state of the asteroids after all collisions. 
# If two asteroids meet, the smaller one will explode. 
# If both are the same size, both will explode. 
# Two asteroids moving in the same direction will never meet.

def asteroidCollision(asteroids):
    stack = []

    for asteroid in asteroids:
        while stack and asteroid < 0 and stack[-1] > 0:
            difference = asteroid + stack[-1]

            if difference < 0:
                stack.pop()
            elif difference > 0:
                asteroid = 0
            else:
                asteroid = 0
                stack.pop()
        
        if asteroid:
            stack.append(asteroid)
            
    return stack

print(asteroidCollision([5,10,-5]))
print(asteroidCollision([8,-8]))
print(asteroidCollision([10,2,-5]))