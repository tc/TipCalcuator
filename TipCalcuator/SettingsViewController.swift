//
//  SettingsViewController.swift
//  TipCalcuator
//
//  Created by Tommy Chheng on 8/21/15.
//  Copyright (c) 2015 Tommy Chheng. All rights reserved.
//

import Foundation

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var defaultTipAmountSettingControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var defaultTipAmount = Setting.loadDefaultTip()
        
        if let i = find(Setting.TIP_AMOUNTS, defaultTipAmount) {
            defaultTipAmountSettingControl.selectedSegmentIndex = i
        } else {
            defaultTipAmountSettingControl.selectedSegmentIndex = 1
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onChangeDefaultSettings(sender: AnyObject) {
        let amount = Setting.TIP_AMOUNTS[defaultTipAmountSettingControl.selectedSegmentIndex]
        
        Setting.saveDefaultTip(amount)
    }
}

