//
//  main.swift
//  pointersOnPointers
//
//  Created by River McCaine on 8/16/22.
//

import Foundation

/*
 https://leetcode.com/problems/two-sum/
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

 You may assume that each input would have exactly one solution, and you may not use the same element twice.

 You can return the answer in any order.
 
 
 Input: nums = [2,7,11,15], target = 9
 Output: [0,1]
 Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
 Example 2:

 Input: nums = [3,2,4], target = 6
 Output: [1,2]
 Example 3:

 Input: nums = [3,3], target = 6
 Output: [0,1]
 */

func findSumOf(arr: [Int] , target: Int) -> [Int] {
    
    var pointerOne      = 0
    var pointerTwo      = arr.count - 1
    let sortedArr       = arr.sorted()
        
    while pointerOne < pointerTwo {
        
        let sum = sortedArr[pointerOne] + sortedArr[pointerTwo]
        
        if sum == target {
            let pointerOneNum = sortedArr[pointerOne]
            let pointerTwoNum = sortedArr[pointerTwo]
            
            let finalIndexOne = arr.firstIndex(of: pointerOneNum)!
            let finalIndexTwo = arr.lastIndex(of: pointerTwoNum)!
                        
            return [finalIndexOne, finalIndexTwo]
        }
        
        else if sum < target {
            pointerOne += 1
        }
        
        else if sum > target {
            pointerTwo -= 1
        }
    }
    
    return []
}

assert(findSumOf(arr: [1,2,7,8,11,15], target: 9) == [0,3])
assert(findSumOf(arr: [3,2,4], target: 6) == [1,2])
assert(findSumOf(arr: [3,3], target: 6) == [0,1])
print("You found a Korok Seed!")
