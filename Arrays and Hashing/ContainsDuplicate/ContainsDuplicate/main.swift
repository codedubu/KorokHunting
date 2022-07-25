//
//  main.swift
//  ContainsDuplicate
//
//  Created by River McCaine on 7/22/22.
//

import Foundation

/*
 https://leetcode.com/problems/contains-duplicate/
 
 Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.

 Example 1:

 Input: nums = [1,2,3,1]
 Output: true
 Example 2:

 Input: nums = [1,2,3,4]
 Output: false
 Example 3:

 Input: nums = [1,1,1,3,3,4,3,2,4,2]
 Output: true
 
 
 */

func containsDuplicate(_ nums: [Int]) -> Bool {
    
    var foundConMen: Set<Int> = []
    
    for num in nums {
        foundConMen.insert(num)
    }
    
    return foundConMen.count != nums.count ? true : false
}


func containsDuplicateOptimized(_ nums: [Int]) -> Bool {

    return Set(nums).count != nums.count ? true : false
}

assert(containsDuplicate([1,2,3,1]) == true)
assert(containsDuplicate([1,2,3,4]) == false)
assert(containsDuplicate([1,1,1,3,3,4,3,2,4,2]) == true)
assert(containsDuplicateOptimized([1,2,3,1]) == true)
assert(containsDuplicateOptimized([1,2,3,4]) == false)
assert(containsDuplicateOptimized([1,1,1,3,3,4,3,2,4,2]) == true)
print("You found Korok Seed!")

