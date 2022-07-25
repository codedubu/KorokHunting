//
//  main.swift
//  PartialWordSearching
//
//  Created by River McCaine on 7/21/22.
//

import Foundation

// https://www.codewars.com/kata/54b81566cd7f51408300022d/train/swift

/*
 Write a method that will search an array of strings for all strings that contain another string, ignoring capitalization. Then return an array of the found strings.
 
 The method takes two parameters, the query string and the array of strings to search, and returns an array.
 
 If the string doesn't contain, return the string "Empty"
 
 Examples
 If the string to search for is "me", and the array to search is ["home", "milk", "Mercury", "fish"], the method should return ["home", "Mercury"].
 */


func wordSearch(_ str: String, _ arr: [String]) -> [String] {
    
    var result: [String] = []
        
    for word in arr {
        
        let lowerCasedWord  = word.lowercased()
        let lowerCasedStr   = str.lowercased()
        
        if lowerCasedWord.contains(lowerCasedStr) {
            result.append(word)
        }
        
    }

    return result.isEmpty ? ["Empty"] : result
}



// MARK: - Testing
assert(wordSearch("ab", ["za", "ab", "abc", "zab", "zbc"]) == ["ab", "abc", "zab"])
assert(wordSearch("aB", ["za", "ab", "abc", "zab", "zbc"]) == ["ab", "abc", "zab"])
assert(wordSearch("ab", ["za", "aB", "Abc", "zAB", "zbc"]) == ["aB", "Abc", "zAB"])
assert(wordSearch("abcd", ["za", "aB", "Abc", "zAB", "zbc"]) == ["Empty"])
assert(wordSearch("me", ["home", "milk", "Mercury", "fish"]) == ["home", "Mercury"])
print("You found a Korok Seed!")



// MARK: - Clever Solutions
func wordSearchRangeFilter(_ str: String, _ arr: [String]) -> [String] {
  let array = arr.filter { $0.lowercased().range(of: str.lowercased()) != nil }
  return array.isEmpty ? ["Empty"] : array
}

func wordSearchCaseFilter(_ str: String, _ arr: [String]) -> [String] {
  let results = arr.filter { $0.localizedCaseInsensitiveContains(str) }
  return results.isEmpty ? ["Empty"] : results
}
