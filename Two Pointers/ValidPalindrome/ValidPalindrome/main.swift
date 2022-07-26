//
//  main.swift
//  ValidPalindrome
//
//  Created by River McCaine on 7/26/22.
//

import Foundation

/*
 https://leetcode.com/problems/valid-palindrome/
 
 A phrase is a palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads the same forward and backward. Alphanumeric characters include letters and numbers.
 
 Given a string s, return true if it is a palindrome, or false otherwise.
 
 Example 1:
 Input: s = "A man, a plan, a canal: Panama"
 Output: true
 Explanation: "amanaplanacanalpanama" is a palindrome.
 
 Example 2:
 Input: s = "race a car"
 Output: false
 Explanation: "raceacar" is not a palindrome.
 
 Example 3:
 Input: s = " "
 Output: true
 Explanation: s is an empty string "" after removing non-alphanumeric characters.
 Since an empty string reads the same forward and backward, it is a palindrome.
 */


// Time Compelxity: O(n)
func isPalindrome(_ s: String) -> Bool {
    
    var formattedString = ""
    
    for character in s {
        if character.isLetter || character.isNumber {
            formattedString.append(character.lowercased())
        }
    }
    
    let reversed = String(formattedString.reversed())
    
    return formattedString == reversed ? true : false
}



// MARK: - Clever Solutions
func isPalindromePointers(_ s : String) -> Bool {
    guard !s.isEmpty else { return true }
    
    let s = Array(s)
    var i = 0
    var j = s.count - 1
    
    while i < j {
        if !s[i].isLetter, !s[i].isNumber { i += 1; continue }
        
        if !s[j].isLetter, !s[j].isNumber { j -= 1; continue }
        
        guard s[i].lowercased() == s[j].lowercased() else { return false }
        i += 1
        j -= 1
    }
    
    return true
}

assert(isPalindrome("A man, a plan, a canal: Panama") == true)
assert(isPalindrome("race a car") == false)
assert(isPalindrome(" ") == true)
print("You found a Korok Seed!")
