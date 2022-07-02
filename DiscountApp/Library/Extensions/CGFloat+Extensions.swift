//
//  CGFloat+Extensions.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 2.07.22.
//

import UIKit

// MARK: - Adaptive layout

extension CGFloat {
    var adaptedFontSize: CGFloat {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return self * UIScreen.main.bounds.height / 810
        }
        return self * UIScreen.main.bounds.height / 390
    }
    
}
