//
//  Setting.swift
//  TipCalcuator
//
//  Created by Tommy Chheng on 8/21/15.
//  Copyright (c) 2015 Tommy Chheng. All rights reserved.
//

import Foundation

class Setting {
    static let TIP_AMOUNTS = [0.10, 0.15, 0.20]
    static let DEFAULT_AMOUNT = "defaultAmount"
    
    static func saveDefaultTip(amount:Double) {
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(amount, forKey: DEFAULT_AMOUNT)
        defaults.synchronize()
    }
    
    static func loadDefaultTip() -> Double {
        var defaults = NSUserDefaults.standardUserDefaults()
        if(defaults.objectForKey(DEFAULT_AMOUNT) != nil) {
            return defaults.doubleForKey(DEFAULT_AMOUNT)
        } else {
            return 0.15
        }
    }
}