# Two rectangles i and j (i < j) are considered interchangeable if they have the same 
# width-to-height ratio. More formally, two rectangles are interchangeable if 
# widthi/heighti == widthj/heightj (using decimal division, not integer division).
# Return the number of pairs of interchangeable rectangles in rectangles.

def interchangeableRectangles(rectangles):
    dict = {}
    result = 0

    for w, h in rectangles:
        dict[w/h] = dict.get(w/h, 0) + 1

    for count in dict.values():
        if count > 1:  
            result += (count * (count - 1)) // 2

    return result

print(interchangeableRectangles([[4,8],[3,6],[10,20],[15,30]]))
print(interchangeableRectangles([[4,5],[7,8]]))