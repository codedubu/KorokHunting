//
//  main.swift
//  ValidBraces
//
//  Created by River McCaine on 8/11/22.
//

import Foundation

/*
 
 // https://www.codewars.com/kata/5277c8a221e209d3f6000b56/swift
 
 What is considered Valid?
 A string of braces is considered valid if all braces are matched with the correct brace.
 
 Examples
 
 "(){}[]"   =>  True
 "([{}])"   =>  True
 "(}"       =>  False
 "[(])"     =>  False
 
 false condition #1
 - You have a closing ), ], or } without an opening seen first.
 
 false condition #2
 - You don't have any closing brackets at all.
 
 false condition #3
 - if you have matched a closing bracket with a opening, but the closingBracket.previous != openingBracket
 
 
 for element in "[({})](]" --> false
 [ - .isOpening   brackets = [
 
 ( - .isOpening   parens = (
 
 { - .isOpening   curlies = {
 
 } - .isClosing   openingCurly has been seen, closing has a match, reset curlies
 
 ) - .isClosing   openingParen has been seen, closing has a match, reset parens
 
 ] - .isClosing   openingBracket has been seen, closing has a maatch, reset brackets
 
 ( - .isOpening   openingParen = (
 
 ] - .isClosing   openingBracket has not been seen -> return false
 
 
 ([])
 
 for element in "[(])" --> false
 
 [ - .isOpening   openingBracket = [
 
 ( - .isOpening   openingParen  = (
 
 ] - .isClosing   openingBracket has been seen BUT the closingBracket.previous != openingBracketOf the same kind OR a closing brace of a different kind -> return false
 
 ) - already left the building
 
 if previous == opening of Different Kind
 if previous ==
 
 
 for element in "[]()" --> true {
 [ - .isOpening   brackets = [
 
 ] - .isClosing   openingBracket has been seen, closingBracket has a match, reset brackets
 
 ( - .isOpening   parens = (
 
 ) - .isClosing   openingParens has been seen, closingParens has a match, reset parens
 
 return true
 
 
 if you dont have any closing brackets at all -> return false
 
 */

func validBraces(string: String) -> Bool {
    
    let braceDict: [Character:Character] = ["]":"[",
                                            ")": "(",
                                            "}":"{"]
    
    let openingBraces: [Character] = ["[", "(", "{" ]
    let closingBraces: [Character] = ["]", ")", "}"]
    
    
    var openingBraceStack: [Character] = []
    
    for element in string {
        
        if openingBraces.contains(element) {
            openingBraceStack.insert(element, at: 0)
            continue
        } else {
            if openingBraceStack.isEmpty { return false }
        }
        
        if closingBraces.contains(element) {
            if openingBraceStack.first != braceDict[element] {
                return false
            } else {
                openingBraceStack.removeFirst()
            }
        }
        
    }
    
    return openingBraceStack.isEmpty
}



assert((validBraces(string:"([{}])") == true))
assert((validBraces(string: "(}") == false))
assert((validBraces(string:"[(])") == false))
assert((validBraces(string:"({})[({})]") == true))
assert((validBraces(string:"(})") == false))
assert((validBraces(string:"(({{[[]]}}))") == true))
assert((validBraces(string:"{}({})[]") == true))
assert((validBraces(string:")(}{][") == false))
assert((validBraces(string:"())({}}{()][][") == false))
assert((validBraces(string:"(((({{") == false))
assert((validBraces(string:"}}]]))}])") == false))
print("You found a Korok Seed!")


// MARK: - Optimizaiton
func validBraces2(string: String) -> Bool {
    
    let braceDict: [Character:Character] = ["[":"]",
                                            "(": ")",
                                            "{":"}"]
    
    var openingBraceStack: [Character] = []
    
    for element in string {
        
        switch element {
        case "[", "(", "{": openingBraceStack.insert(element, at: 0)
        case "]", ")", "}": guard !openingBraceStack.isEmpty, braceDict[openingBraceStack.removeFirst()] == element else { return false }
        default: return false
        }
    }
    
    return openingBraceStack.isEmpty
}
