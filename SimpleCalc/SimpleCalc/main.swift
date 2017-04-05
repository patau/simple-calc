//
//  main.swift
//  CmdDemo
//
//  Created by Patricia Au on 3/30/17.
//  Copyright © 2017 Patricia Au. All rights reserved.
//

import Foundation
print("Enter an expression separated by returns:")
print("Available expressions: count, avg, fact (These do not support operators)")
print("Enter \"=\" to calculate expression")

var nums = [String]()
var input: String = readLine(strippingNewline: true)!

while input != "count", input != "avg", input != "fact", input != "=" {
    if Float(input) != nil {
        nums.append(input)
    } else {
        switch input {
        case "+", "-", "*", "/":
            nums.append(input)
        default:
            print("You did not enter a valid value")
        }
    }
    input = readLine(strippingNewline: true)!
}

if input == "count" {
    for num in nums {
        print(num + " ", terminator: "")
    }
    print("count => \(nums.count)")
} else if input == "avg" {
    var count = 0.0
    for num in nums {
        count += Double(num)!
        print(num + " ", terminator: "")
    }
    var avg:Double = count/Double(nums.count)
    print("avg => \(avg)")
} else if input == "fact" {
    if nums.count > 1 {
        print("Fact can only accept one number")
    } else {
        var total = 1
        for index in 1...Int(nums[0])! {
            total *= index
        }
        print("\(Int(nums[0])!) fact => \(total)")
    }
} else {
    var runningTotal: Double = Double(nums[0])!
    var index = 1
    while (index < nums.count) {
        switch nums[index] {
        case "+":
            runningTotal += Double(nums[index + 1])!
            index += 2
        case "-":
            runningTotal -= Double(nums[index + 1])!
            index += 2
        case "*":
            runningTotal *= Double(nums[index + 1])!
            index += 2
        case "/":
            runningTotal /= Double(nums[index + 1])!
            index += 2
        default: //number
            index += 1
        }
        print(runningTotal)
    }
    print("Result: \(runningTotal)")
}

