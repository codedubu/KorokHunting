//
//  main.swift
//  PlusOne
//
//  Created by River McCaine on 8/23/22.
//

import Foundation

/*
 You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
 
 Increment the large integer by one and return the resulting array of digits.
 
 Example 1:
 Input: digits = [1,2,3]
 Output: [1,2,4]
 Explanation: The array represents the integer 123.
 Incrementing by one gives 123 + 1 = 124.
 Thus, the result should be [1,2,4].
 
 Example 2:
 Input: digits = [4,3,2,1]
 Output: [4,3,2,2]
 Explanation: The array represents the integer 4321.
 Incrementing by one gives 4321 + 1 = 4322.
 Thus, the result should be [4,3,2,2].
 
 Example 3:
 Input: digits = [9]
 Output: [1,0]
 Explanation: The array represents the integer 9.
 Incrementing by one gives 9 + 1 = 10.
 Thus, the result should be [1,0].
 
 
 */

func plusOne(_ digits: [Int]) -> [Int] {
    
    var digits = digits
    
    if digits[digits.count - 1] != 9 {
        digits[digits.count - 1] += 1
        return digits
    }
    
    for i in (0...digits.count-1).reversed() {
        if digits[i] == 9 {
            if i == 0 && digits[i] == 9 {
                digits = [1,0] + digits.dropFirst()
                break
            }
            
            if digits[i-1] == 9 {
                digits[i] = 0
            }
            
            else if digits[i-1] != 9 {
                digits[i] = 0
                digits[i-1] += 1
                break
            }
        }
    }
    
    return digits
}

let edgeArray: [Int]    = .init(repeating: 9, count: 100)
let edgeResult: [Int]   = [1] + .init(repeating: 0, count: 100)

assert(plusOne([1,2,3]) == [1,2,4])
assert(plusOne([4,3,2,1]) == [4,3,2,2])
assert(plusOne([9]) == [1,0])
assert(plusOne([0]) == [1])
assert(plusOne([1,9,9]) == [2, 0, 0])
assert(plusOne([2,8,7,9,9]) == [2,8,8,0,0])
assert(plusOne([9,9,9]) == [1,0,0,0])
assert(plusOne([1,9,9,9,9,9]) == [2,0,0,0,0,0])
assert(plusOne([1,8,9]) == [1,9,0])
assert(plusOne([9,8,7,6,5,4,3,2,1,0]) == [9,8,7,6,5,4,3,2,1,1])
assert(plusOne(edgeArray) == edgeResult)

print("You found a Korok Seed!")
