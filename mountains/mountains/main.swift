//
//  main.swift
//  mountains
//
//  Created by River McCaine on 8/22/22.
//

import Foundation

/*
 
 Given an array of integers, return true if it is a valid mountain array. (A valid
 mountain array must have length greater or equal to 3, and there exists some
 index such that all items before and all the items after are less than
 array[index])
 
 */

func isMountain(arr: [Int]) -> Bool {
    
    if arr.count <= 3 { return false }
    
    for i in arr.indices {
        for j in arr.indices {
            
            if i == j { continue }
            print("i", arr[i], "j", arr[j])
            
            if arr[i] < arr[j] { break }
            
            if arr[i] == arr[j] { break }
            
            if j == arr.count - 1  && arr[i] < arr[j] { return true }
        }
    }
    
    return false
}


extension Array where Element == Int {
  var isMountain: Bool {
    true
    }
}

assert(isMountain(arr: [-2, 1, 5, 4]) == true)
assert(isMountain(arr: [-2, 1, 0, 4, 15, 7, 2]) == true)
assert(isMountain(arr: [-2, 3, 4, 7]) == false)
assert(isMountain(arr: [2, 1]) == false)
assert(isMountain(arr: [1, 4, 4, 2]) == false)
assert(isMountain(arr: [-2, 5, 3, 1, 8]) == false)
assert(isMountain(arr: [9,8,7,6,5,4,3,2,1,0]) == false)
assert(isMountain(arr: [0,3,2,1]) == true)

print("You found a Korok Seed!")

//assert([-2, 1, 5, 4].isMountain, equals: true)
//assert([-2, 1, 0, 4, 15, 7, 2].isMountain, equals: true)
//assert([-2, 3, 4, 7].isMountain, equals: false)
//assert([2, 1].isMountain, equals: false)
//assert([1, 4, 4, 2].isMountain, equals: false)
//assert([-2, 5, 3, 1, 8].isMountain, equals: false)

// Add other test cases here

//
//func assert(_ exp: @autoclosure () -> Bool, equals expected: Bool) {
//  let result = exp() == expected
//  if result == true {
//    print("🎉 SUCCESS")
//  } else {
//    print("😭 FAIL")
//  }
//}
