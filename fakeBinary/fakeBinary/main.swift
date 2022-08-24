//
//  main.swift
//  fakeBinary
//
//  Created by River McCaine on 7/7/22.
//

import Foundation



func fakeBin(digits: String) -> String {
    
    // guard !digits.isEmpty else {
    //print("pUT SOMETHING IN HERE")
    //return }
    // iterate through every character in the strong
    // convert the character to an int
    // make a boolean check to see if the int is less than five
    // if its less then five, make it 0, if its more than five make it 1
    // return the results back as a string
    // profit
    
    var finalString = ""
    
    guard !digits.isEmpty else {
        return ""
    }
    
    for char in digits {
        if let convertedChar = Int(String(char)) {
            
            if convertedChar < 5 {
                finalString.append("0")
            } else if convertedChar >= 5 {
                finalString.append("1")
            }
            
        } else {
            
            return "Your input needs to be all strings"
        }
    }
    
    return finalString
}


assert(fakeBin(digits: "45385593107843568") == "01011110001100111" )
assert(fakeBin(digits: "509321967506747") == "101000111101101")
assert(fakeBin(digits: "366058562030849490134388085") == "011011110000101010000011011")
assert(fakeBin(digits: "15889923") == "01111100")
assert(fakeBin(digits: "800857237867") == "100111001111")
assert(fakeBin(digits: "") == "")
print("PROFIT!")
print("a" > "5")
print("a" > "A")
print("." < "5")
print("😊" > "5")
//"0"<"1"<2<3<4<5<6<7<89ABCDEFG...abcdefghijk...
let names = ["Ami", "Dan", "Bill"]
print(names.sorted())
//U+1F600
