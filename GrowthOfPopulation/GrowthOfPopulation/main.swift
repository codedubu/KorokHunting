//
//  main.swift
//  GrowthOfPopulation
//
//  Created by River McCaine on 8/25/22.
//

import Foundation

/*
 https://www.codewars.com/kata/563b662a59afc2b5120000c6
 
 In a small town the population is p0 = 1000 at the beginning of a year. The population regularly increases by 2 percent per year and moreover 50 new inhabitants per year come to live in the town. How many years does the town need to see its population greater or equal to p = 1200 inhabitants?
 
 
 At the end of the first year there will be:
 1000 + 1000 * 0.02 + 50 => 1070 inhabitants

 At the end of the 2nd year there will be:
 1070 + 1070 * 0.02 + 50 => 1141 inhabitants (** number of inhabitants is an integer **)

 At the end of the 3rd year there will be:
 1141 + 1141 * 0.02 + 50 => 1213

 It will need 3 entire years.
 
 
 More generally given parameters:

 p0, percent, aug (inhabitants coming or leaving each year), p (population to surpass)

 the function nb_year should return n number of entire years needed to get a population greater or equal to p.

 aug is an integer, percent a positive or null floating number, p0 and p are positive integers (> 0)
 
 
 Examples:
 nb_year(1500, 5, 100, 5000) -> 15
 nb_year(1500000, 2.5, 10000, 2000000) -> 10

 */

func growthOfPopulation(startingPop: Int, pIncrease: Double, newPeople: Int, targetPopulation: Int) -> Int {

    var currentPopulation = Double(startingPop)
    var yearCounter = 0

    while currentPopulation < Double(targetPopulation) {
        currentPopulation += currentPopulation * (pIncrease/100) + Double(newPeople)
        yearCounter += 1
    }

    return yearCounter
}


assert(growthOfPopulation(startingPop: 1000, pIncrease: 2, newPeople: 50, targetPopulation: 1200) == 3)
assert(growthOfPopulation(startingPop: 1500, pIncrease: 5, newPeople: 100, targetPopulation: 5000) == 15)
assert(growthOfPopulation(startingPop: 1500000, pIncrease: 2.5, newPeople: 10000, targetPopulation: 2000000) == 10)
print("You found a Korok Seed!")
