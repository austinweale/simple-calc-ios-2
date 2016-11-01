//
//  ViewController.swift
//  simple-calc
//
//  Created by iGuest on 10/25/16.
//  Copyright © 2016 iGuest. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet var wholeApp: UIView!
	
		//text area for the input and answer display
    @IBOutlet weak var textArea: UILabel!
    
    var hasOperator = false
	
	
		//number related buttons function
    @IBAction func buttonTouch(_ sender: AnyObject) {
        let current = sender.titleLabel!!.text!
        let lastInput = self.textArea.text!
        self.textArea.text = "\(lastInput)\(current)"
    }
	
		//operation related buttons. only allows one operator to be used
    @IBAction func operation(_ sender: AnyObject) {
        if(!hasOperator){
            hasOperator = !hasOperator
        
            let current = sender.titleLabel!!.text!
            let lastInput = self.textArea.text!
            self.textArea.text = "\(lastInput) \(current) "
        }
    }
	
		//clear button: clears the display
    @IBAction func clear(_ sender: AnyObject) {
        clear()
    }
	
		//clears the display
    func clear(){
        hasOperator = false
        self.textArea.text = ""
    }
	
		//for equals button: parses the input area and does the operation. displays answer in the input area 
		//so you can use the answer for more operations
    @IBAction func enterCommand(_ sender: AnyObject) {
        let expression = (self.textArea.text!).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let expressionArray = expression.components(separatedBy: " ")
			
        clear()
        if(expressionArray.count == 3){
            let currentOperator = expressionArray[1]
        
            let first: Int = Int(expressionArray[0])!
            let second : Int = Int(expressionArray[2])!
            var result = 0
            switch currentOperator {
            case "+":
                result = first + second
            case "-":
                result = first - second
            case "*":
                result = first * second
            case "/":
                result = first / second
            case "%":
                result = first % second
            default:
                result = -1
            }
            self.textArea.text = "\(result)"
			}
    }
	
		//add spaces for the multi-entry operations, won't allow the user to enter other 
		//operations beside other spaces
    @IBAction func addSpace(_ sender: AnyObject) {
        hasOperator = true
        let lastInput = self.textArea.text!
        self.textArea.text = "\(lastInput) "
			
    }
	
		//performs factorial on the input given that there is only one number entered
    @IBAction func factorial(_ sender: AnyObject) {
        let expression = (self.textArea.text!).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let expressionArray = expression.components(separatedBy: " ")
        if(expressionArray.count == 1){
            let num : Int = Int(expressionArray[0])!
            var result = 1
            for i in 1...num {
                result *= i
            }
            self.textArea.text = "\(result)"
        }
    }
	
		//displays count of the input
    @IBAction func count(_ sender: AnyObject) {
        let expression = (self.textArea.text!).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let expressionArray = expression.components(separatedBy: " ")
        self.textArea.text = "\(expressionArray.count)"
    }
	
		//displays average of all input
    @IBAction func avg(_ sender: AnyObject) {
        let expression = (self.textArea.text!).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let expressionArray = expression.components(separatedBy: " ")
        let count = expressionArray.count
        
        var result = 0
        for i in 0...count - 1 {
            result += Int(expressionArray[i])!
        }
        self.textArea.text = "\(result / count)"
    }
}

