//
//  main.swift
//  CenturyFromYear
//
//  Created by River McCaine on 7/21/22.
//

import Foundation

// https://www.codewars.com/kata/5a3fe3dde1ce0e8ed6000097

/*
 Introduction
 The first century spans from the year 1 up to and including the year 100, the second century - from the year 101 up to and including the year 200, etc.

 Task
 Given a year, return the century it is in.
 
 Examples:
 1705 --> 18
 1900 --> 19
 1601 --> 17
 2000 --> 20
 */


func centuryOn(_ year: Int) -> Int {
    
    var yearCounter     = 0
    var centuryCounter  = 1
    
    for _ in 1...year {
        
        yearCounter += 1
        
        if yearCounter >= 101 {
            centuryCounter += 1
            yearCounter = 1
        }
    }
    
    return centuryCounter
}


func centuryO1(_ year: Int) -> Int {
    
    let result          = Double(year)/100.0
    let roundedCentury  = Int(result.rounded(.up))
    
    return roundedCentury
}

/*
 every 100 years is a century
 so, any time anything goes to 101 years
 we will have a century
 
 
 1601/100   = 16.01     wants to be: 17
 101/100    = 1.01      wants to be: 2
 10 / 100   = 0.1       wants to be: 1
 
 based on these findings, we can make the assumption that any time there's a decimal, we can round up
 */



// MARK: - Testing

assert(centuryOn(1705) == 18)
assert(centuryOn(1900) == 19)
assert(centuryOn(1601) == 17)
assert(centuryOn(2000) == 20)
assert(centuryOn(89) == 1)
assert(centuryO1(1705) == 18)
assert(centuryO1(1900) == 19)
assert(centuryO1(1601) == 17)
assert(centuryO1(2000) == 20)
assert(centuryO1(89) == 1)
print("You found Korok!")
