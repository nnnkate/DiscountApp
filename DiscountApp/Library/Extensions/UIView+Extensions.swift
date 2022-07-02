//
//  UIView+Extensions.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 29.06.22.
//

import UIKit

// MARK: - Appearance methods

extension UIView {
    func addShadow() {
        self.layer.borderWidth = 0
        self.layer.shadowColor =  UIColor.getCustomPinkColor().cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 0)
        self.layer.shadowRadius = 15
        self.layer.shadowOpacity = 0.9
    }
    
    func applyGradient(colors: [CGColor], cornerRadius: CGFloat = 0) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        gradient.cornerRadius = 15
        gradient.position = self.center
        gradient.colors = colors
        
        self.layer.insertSublayer(gradient, at: 0)
    }
}

// MARK: - Animation

extension UIView {
    func transitionAnimation() {
        let animation = CATransition()
        animation.type = .push
        animation.subtype = .fromBottom
        animation.duration = 0.2
        animation.speed = 0.4
       
        var height = self.bounds.height
        if UIDevice.current.userInterfaceIdiom == .pad {
            height = 24.verticalAdapted
        } else {
            height = 18.verticalAdapted
        }
            
        self.layer.bounds = CGRect(x: 0, y: 0, width: self.bounds.width, height: height)
        self.layer.add(animation, forKey: CATransitionType.push.rawValue)
    }
}
