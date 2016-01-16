//
//  ViewController.swift
//  XCalc
//
//  Created by Akshay Shinde on 1/15/16.
//  Copyright (c) 2016 Akshay Shinde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!

    var userIsInTheMiddleOfTypingANumber: Bool = false;
    var operandStack = [Double]();
    var displayValue: Double{
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue;
        } 
        set{
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false;
        }
    }
    
    @IBAction func appendDigit(sender: UIButton) {
        let digit = sender.currentTitle!;
        if userIsInTheMiddleOfTypingANumber {
            display.text = display.text! + digit;
        }else{
            display.text = digit;
            userIsInTheMiddleOfTypingANumber = true;
        }
    }


    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false;
        operandStack.append(displayValue)
        println("operandStack = \(operandStack)")
        
    }
}

