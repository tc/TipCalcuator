//
//  ViewController.swift
//  TipCalcuator
//
//  Created by Tommy Chheng on 8/21/15.
//  Copyright (c) 2015 Tommy Chheng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var amountField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipAmountControl: UISegmentedControl!
    
    let tipAmounts = Setting.TIP_AMOUNTS

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        var defaultTipAmount = Setting.loadDefaultTip()
        
        if let i = find(tipAmounts, defaultTipAmount) {
            tipAmountControl.selectedSegmentIndex = i
        } else {
            tipAmountControl.selectedSegmentIndex = 1
        }
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateAmounts", name: "UITextFieldTextDidChangeNotification", object: nil)
        
        updateAmounts()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onClickTipAmount(sender: AnyObject) {
        updateAmounts()
    }
    
    func updateAmounts() {
        let amount = NSString(string:amountField.text).doubleValue
        
        let tipAmount = tipAmounts[tipAmountControl.selectedSegmentIndex]
        let tipTotal = tipAmount * amount
        
        tipAmountLabel.text = String(format: "%.2f", tipTotal)
        totalAmountLabel.text = String(format: "%.2f", tipTotal + amount)
    }
}

