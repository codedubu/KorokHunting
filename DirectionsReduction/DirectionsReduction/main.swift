//
//  main.swift
//  DirectionsReduction
//
//  Created by River McCaine on 7/21/22.
//

import Foundation

//https://www.codewars.com/kata/550f22f4d758534c1100025a

/*
 Once upon a time, on a way through the old wild mountainous west,…
 … a man was given directions to go from one point to another. The directions were "NORTH", "SOUTH", "WEST", "EAST". Clearly "NORTH" and "SOUTH" are opposite, "WEST" and "EAST" too.
 
 Going to one direction and coming back the opposite direction right away is a needless effort. Since this is the wild west, with dreadful weather and not much water, it's important to save yourself some energy, otherwise you might die of thirst!
 
 How I crossed a mountainous desert the smart way.
 The directions given to the man are, for example, the following:
 
 ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"].
 
 So the task is to give to the man a simplified version of the plan. A better plan in this case is simply:
 
 ["WEST"]
 
 
 Other examples:
 In ["NORTH", "SOUTH", "EAST", "WEST"], the direction "NORTH" + "SOUTH" is going north and coming back right away.
 
 The path becomes ["EAST", "WEST"], now "EAST" and "WEST" annihilate each other, therefore, the final result is [] (nil in Clojure).
 
 In ["NORTH", "EAST", "WEST", "SOUTH", "WEST", "WEST"], "NORTH" and "SOUTH" are not directly opposite but they become directly opposite after the reduction of "EAST" and "WEST" so the whole path is reducible to ["WEST", "WEST"].
 */

func reduceBad(_ directions: [String]) -> [String] {
    
    let guideDict = ["NORTH": "SOUTH",
                     "SOUTH": "NORTH",
                     "EAST": "WEST",
                     "WEST": "EAST"]
    
    var seenDirections: [String] = []
    
    for direction in directions {
        
        if seenDirections.isEmpty {
            seenDirections.append(direction)
            continue
        }
        
        if let lastSeen = seenDirections.last,
           let oppositeDirection = guideDict[direction] {
            
            if lastSeen == oppositeDirection {
                seenDirections.removeLast()
            } else {
                seenDirections.append(direction)
            }
        }
    }
    
    return seenDirections
}



// MARK: - Testing

var directions = ["NORTH", "SOUTH", "SOUTH", "EAST", "WEST", "NORTH", "WEST"]
assert(reduceBad(directions) == ["WEST"])

directions = ["EAST", "EAST", "WEST", "NORTH", "WEST", "EAST", "EAST", "SOUTH", "NORTH", "WEST"]
assert(reduceBad(directions) == ["EAST", "NORTH"])

directions = ["NORTH", "WEST", "SOUTH", "EAST"]
assert(reduceBad(directions) == ["NORTH", "WEST", "SOUTH", "EAST"])

print("You found a Korok Seed!")
