//
//  ViewController.swift
//  tips2.0
//
//  Created by Carlos Canas on 6/29/15.
//  Copyright (c) 2015 Carlos Canas. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var tipQuote: UILabel!
    @IBOutlet weak var billFieldBackground: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Focus on the form field.
        billField.delegate = self
        self.billField.becomeFirstResponder()
        
        // Add corners to total view area
        totalView.layer.cornerRadius = 4
        
        // Tip and total labels
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Reformat textfield to generate decimals
    
    @IBAction func onEditingChanged(sender: AnyObject) {
        // println("Test")
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        if (tipControl.selectedSegmentIndex == 0) {
            self.tipQuote.text = "On a budget these days are we?"
        } else if (tipControl.selectedSegmentIndex == 1) {
            self.tipQuote.text = "Decent tip... No complaints."
        } else if (tipControl.selectedSegmentIndex == 2) {
            tipQuote.text = "Nice Tip! You must be a baller."
        } else {
            self.tipQuote.text = ""
        }
        
        var billAmount = NSString(string: billField.text).doubleValue
        
        var tip = billAmount * tipPercentage
        
        var total = billAmount + tip
        
        tipLabel.text = "$\(tip)"
        totalLabel.text = "$\(total)"
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)

    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

