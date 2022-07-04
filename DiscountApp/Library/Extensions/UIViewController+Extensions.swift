//
//  UIViewController+Extensions.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 4.07.22.
//

import UIKit

extension UIViewController {
    var isPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
}
  
