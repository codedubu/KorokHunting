//
//  main.swift
//  DataReverse
//
//  Created by River McCaine on 7/28/22.
//

import Foundation


/*
 https://www.codewars.com/kata/569d488d61b812a0f7000015
 
 DESCRIPTION:
 A stream of data is received and needs to be reversed.
 
 Each segment is 8 bits long, meaning the order of these segments needs to be reversed, for example:
 
 11111111  00000000  00001111  10101010
 (byte1)   (byte2)   (byte3)   (byte4)
 should become:
 
 10101010  00001111  00000000  11111111
 (byte4)   (byte3)   (byte2)   (byte1)
 The total number of bits will always be a multiple of 8.
 
 The data is given in an array as such:
 
 [1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1,0,1,0]
 Note: In the C and NASM languages you are given the third parameter which is the number of segment blocks.
 
 
 every 8 bits = byte
 
 sample data:
 
 input: [Int] -> [Int]
 [byte1, byte2, byte 3] -> [byte 3, byte 2, byte1]
 
 
 input.count % 8 == 0 if its not, then we don't consider the whole thing
 
 var count = 0
 var tempBytes = [Int]
 var tempGroup = [[Int]]
 
 iterate through every single bit in our array
 keep a count of how many bits we've seen
 once we found 8 bits, we then hold on to this as a byte
 move on to the next 8, until we have a group of bytes consisting of 8 bits each
 
 reverse the order of the bytes
 split everything out again into one larger group of integers
 
 n == (m * o)
 O(n) + O(n) == O(2n) == O(n)
 
 */

func reverseData(input: [Int]) -> [Int] {
    
    if input.count % 8 != 0 { return [] }
    
    var count               = 0
    var tempBits: [Int]     = []
    var tempBytes: [[Int]]  = []
    var finalResult: [Int]  = []
    
    for bit in input {
        
        tempBits.append(bit)
        
        count += 1
        
        if count % 8 == 0 {
            tempBytes.append(tempBits)
            tempBits = []
        }
    }
    
    for byte in tempBytes.reversed() {
        for bit in byte {
            finalResult.append(bit)
        }
    }
    
    return finalResult
}



assert(reverseData(input: [1,1,1,1,1,1,1,1,0,0,0,0,0,0,0,0,0,0,0,0,1,1,1,1,1,0,1,0,1,0,1,0]) == [1,0,1,0,1,0,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,0,0,0,1,1,1,1,1,1,1,1])
print("You found a Korok Seed!")
