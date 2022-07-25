//
//  main.swift
//  TwoSums
//
//  Created by River McCaine on 7/25/22.
//

import Foundation

/*
 https://leetcode.com/problems/two-sum/
 
 Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
 
 You may assume that each input would have exactly one solution, and you may not use the same element twice.
 
 You can return the answer in any order.
 
 
 Example 1:
 
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

// O(n^2)
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    
    var result: [Int] = []
    
    for i in 0..<nums.count {
        for j in 0..<nums.count {
            if i == j { continue }
            
            if nums[i] + nums[j] == target {
                
                result.append(contentsOf: [i,j])
                return result
            }
        }
    }
    
    return []
}

assert(twoSum([2,7,11,15], 9) == [0,1])
assert(twoSum([3,2,4], 6) == [1,2])
assert(twoSum([3,3], 6) == [0,1])
print("You found a Korok Seed!")

