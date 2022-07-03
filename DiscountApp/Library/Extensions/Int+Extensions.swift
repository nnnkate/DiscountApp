//
//  Int+Extensions.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 30.06.22.
//

import UIKit

// MARK: - TimeComponents

typealias TimeComponents = (days: Int, hours: Int, minutes: Int, seconds: Int)

extension Int {
    func getTimeComponents() -> TimeComponents {
        var timerCounter = self
        let days = timerCounter / (24 * 60 * 60)
        timerCounter -= (days * (24 * 60 * 60))
        let hours = timerCounter / (60 * 60)
        timerCounter -= (hours * (60 * 60))
        let minutes = timerCounter / 60
        timerCounter -= minutes * 60
        
        return (days, hours, minutes, timerCounter)
    }
}

// MARK: - Adaptive layout

extension Int {
    var verticalAdapted: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return CGFloat(self)  * UIScreen.main.bounds.width / 1080
        }
        return CGFloat(self) * UIScreen.main.bounds.width / 844
    }
    
    var horizontalAdapted: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return CGFloat(self) * UIScreen.main.bounds.height / 810
        }
        return CGFloat(self) * UIScreen.main.bounds.height / 390
    }
}
