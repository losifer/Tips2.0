//
//  ViewController.swift
//  tips2.0
//
//  Created by Carlos Canas on 6/29/15.
//  Copyright (c) 2015 Carlos Canas. All rights reserved.
//

// Add Autolayout


import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet var billFieldLine: UIView!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalView: UIView!
    @IBOutlet weak var tipQuote: UILabel!
    @IBOutlet weak var billFieldBackground: UIView!
    @IBOutlet var tipText: UILabel!
    @IBOutlet var billAmountText: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Focus on the form field.
        billField.becomeFirstResponder()
        billField.transform = CGAffineTransformMakeTranslation(0, 80)
        billFieldLine.alpha = 0
        billFieldLine.transform = CGAffineTransformMakeTranslation(0, 80)
        billAmountText.transform = CGAffineTransformMakeTranslation(0, 80)
        
        // Add corners to total view area
        totalView.layer.cornerRadius = 4
        
        // Keep them hidden
        totalView.alpha = 0
        tipControl.alpha = 0
        tipText.alpha = 0
        tipLabel.alpha = 0
        tipQuote.alpha = 0
        
        // Tip and total labels
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
    }

    
    @IBAction func onEditingChanged(sender: AnyObject) {
        
            UIView.animateWithDuration(0.4, animations: {
                // Fade them in.
                self.totalView.alpha = 1.0
                self.tipControl.alpha = 1.0
                self.tipText.alpha = 1.0
                self.tipLabel.alpha = 1.0
                self.tipQuote.alpha = 1.0
                self.billFieldLine.alpha = 1.0
            })
        
        UIView.animateWithDuration(0.6, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.53, options: .CurveEaseOut, animations: {
            
             self.billField.transform = CGAffineTransformMakeTranslation(0, 0)
             self.billFieldLine.transform = CGAffineTransformMakeTranslation(0, 0)
             self.billAmountText.transform = CGAffineTransformMakeTranslation(0, 0)
            
        }, completion: nil)
        
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        if (tipControl.selectedSegmentIndex == 0) {
            self.tipQuote.text = "On a budget these days are we?"
        } else if (tipControl.selectedSegmentIndex == 1) {
            self.tipQuote.text = "Decent tip... \n No complaints."
        } else if (tipControl.selectedSegmentIndex == 2) {
            tipQuote.text = "Nice Tip! \n You must be a baller."
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

    @IBAction func tipControl(sender: UISegmentedControl) {
        view.endEditing(true)
        
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
}

