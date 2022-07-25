//
//  main.swift
//  ValidAnagram
//
//  Created by River McCaine on 7/22/22.
//

import Foundation

/*
 https://leetcode.com/problems/valid-anagram/
 
 Given two strings s and t, return true if t is an anagram of s, and false otherwise.
 
 An Anagram is a word or phrase formed by rearranging the letters of a different word or phrase, typically using all the original letters exactly once.
 
 Example 1:
 Input: s = "anagram", t = "nagaram"
 Output: true
 
 Example 2:
 Input: s = "rat", t = "car"
 Output: false
 */


func isAnagram(_ s: String, _ t: String) -> Bool {
    var sDict: [String : Int] = [:]
    var tDict: [String : Int] = [:]
    
    for letter in s {
        let sKey = String(letter.lowercased())
        
        var count = sDict[sKey, default: 0]
        count += 1
        sDict[String(letter)] = count
    }
    
    for letter in t {
        let tKey = String(letter.lowercased())
        
        var count = tDict[tKey, default: 0]
        count += 1
        tDict[String(letter)] = count
    }
    
    return sDict == tDict ? true : false
}


func isAnagram2(_ s:String, _ t: String) -> Bool {
    if s.lowercased().sorted() == t.lowercased().sorted() {
        return true
    } else {
        return false
    }
}

assert(isAnagram("anagram", "nagaram") == true)
assert(isAnagram("rat", "car") == false)
assert(isAnagram("aa", "a") == false)
assert(isAnagram("aacc", "ccac") == false)
assert(isAnagram2("anagram", "nagaram") == true)
assert(isAnagram2("rat", "car") == false)
assert(isAnagram2("aa", "a") == false)
assert(isAnagram2("aacc", "ccac") == false)
print("You found a Korok!")


// MARK: - Clever Solutions
func isAnagramBonus(_ s: String, _ t: String) -> Bool {
    guard s.count == t.count else { return false }
    
    var map: [Character : Int] = [:]
    for (c1, c2) in zip(s,t) {
        map[c1, default: 0] += 1
        map[c2, default: 0] -= 1
    }
    return map.reduce(0, { $0 + abs($1.value) }) == 0
}

