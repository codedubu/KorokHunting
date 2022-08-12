//
//  main.swift
//  ManhattanDistance
//
//  Created by River McCaine on 8/4/22.
//

import Foundation

/*
 // https://www.codewars.com/kata/52998bf8caa22d98b800003a
 
 Manhattan distance is the distance between two points in a grid (like the grid-like street geography of the New York borough of Manhattan) calculated by only taking a vertical and/or horizontal path.

 Complete the function that accepts two points and returns the Manhattan Distance between the two points.

 The points are arrays or tuples containing the x and y coordinate in the grid. You can think of x as the row in the grid, and y as the column.
*/

func manhattanDistance(pointA a: [Int], pointB b: [Int]) -> Int {
    let hPoints = [a[0], b[0]].sorted()
    let vPoints = [a[1], b[1]].sorted()
    
    let hDistance = hPoints[1] - hPoints[0]
    let vDistance = vPoints[1] - vPoints[0]
    
    let manhattanDistance = hDistance + vDistance
    
    return manhattanDistance
}

assert(manhattanDistance(pointA: [5,4], pointB: [3,2]) == 4)
assert(manhattanDistance(pointA: [1,1], pointB: [0,3]) == 3)
assert(manhattanDistance(pointA: [1,1], pointB: [1,1]) == 0)
print("You found a Korok Seed!")


// MARK: - Notes
/*
 y - - - - - a     [5,4] = a
   - - c - - -     [3,2] = b
   - - - b d -     horizontalDistance: aHorizontal(5) -> bHorizontal(3) = 2
   - - - - - -     verticalDistance:   aVertical(4)   -> bVertical(2)   = 2
   - - - - - -
             x
 
                   [2, 3] = c
a                  [4, 2] = d
horizontal         horizontalDistance: cHorizontal(2) -> bHorizontal(4) = 2
- 1 step left      verticalDistance:   cVertical(3)   -> dVertical(2)   = 1
- 1 step left

vertical
- 1 step down
- 1 step down
b
                    (horizontalDistance) + (verticalDistance) = manhattanDistance
*/

// MARK: - First Attempt
func getManhattanDistance(x: [Int], y: [Int]) -> Int {
     let manhattanDistance = verticalDistance(x: x, y: y) + horizontalDistance(x: x, y: y)

    return manhattanDistance
}


func verticalDistance(x: [Int], y:[Int]) -> Int {
    var vPoints: [Int] = []

    vPoints.append(contentsOf: [x[1], y[1]])
    let sortedV = vPoints.sorted()
    let vDistance = sortedV[1] - sortedV[0]

    return vDistance
}


func horizontalDistance(x: [Int], y: [Int]) -> Int {
    var hPoints: [Int] = []

    hPoints.append(contentsOf: [x[0], y[0]])
    let sortedH = hPoints.sorted()
    let hDistance = sortedH[1] - sortedH[0]

    return hDistance
}
