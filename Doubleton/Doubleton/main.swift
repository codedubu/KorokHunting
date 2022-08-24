//
//  main.swift
//  Doubleton
//
//  Created by River McCaine on 8/24/22.
//

import Foundation

/*
 https://www.codewars.com/kata/604287495a72ae00131685c7/train/swift
 
 We will call a natural number a "doubleton number" if it contains exactly two distinct digits. For example, 23, 35, 100, 12121 are doubleton numbers, and 123 and 9980 are not.

 For a given natural number n (from 1 to 1 000 000), you need to find the next doubleton number. If n itself is a doubleton, return the next bigger than n.
 */

func doubleton(_ num: Int) -> Int {
    
     var trackedNumber = num
     
     trackedNumber += 1
     
     while isDoubleton(num: trackedNumber) == false {
     trackedNumber += 1
}
     
     return trackedNumber
}


func isDoubleton(num: Int) -> Bool {
    let stringNumber    = String(num)
    let numArray        = Array(stringNumber)
    let numSet          = Set(numArray)
    
    return numSet.count == 2 ? true : false
}

assert(doubleton(130)   == 131)
assert(doubleton(1434)  == 1441)
assert(doubleton(20)    == 21)
assert(doubleton(5)     == 10)
assert(doubleton(131)   == 133)
print("You found a Korok seed!")
