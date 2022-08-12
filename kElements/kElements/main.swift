//
//  main.swift
//  kElements
//
//  Created by River McCaine on 8/12/22.
//

import Foundation

func findMax(nums: [Int], k: Int) -> [Int] {
    
    var thang: [Int] = []

    let sortedArray = nums.sorted()
    var count = sortedArray.count
    
    for _ in 0..<k {
        thang.append(sortedArray[count-1])
        count -= 1
    }
    
    return thang
}


func pairSum(arr: [Int], k: Int) -> Set<[Int]> {
    
    var result: Set<[Int]> = []
    
    for numOne in arr {
        for numTwo in arr {
            
            if numOne == numTwo { break }
            
            if numOne + numTwo == k {
                result.insert([numOne, numTwo])
            }
        }
    }
    
    return result
}

assert(findMax(nums: [5, 16, 7, 9, -1, 4, 3, 11, 2], k: 3) == [16,11,9])
assert(pairSum(arr: [1,9,6,3,5,4], k: 10) == [[9, 1], [4,6]])


// MARK: - Extras
//func findKElements(arr: [Int] , k: Int) -> [Int] {
//
//    let maxKElements = Array(arr.sorted().suffix(k))
//
//    return maxKElements
//}
//
//print(findKElements(arr: [5, 16, 7, 9, -1, 4, 3, 11, 2], k: 3))

