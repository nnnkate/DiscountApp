//
//  UIView+Extensions.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 29.06.22.
//

import UIKit

// MARK: - Appearance methods

extension UIView {
    func addShadow(color: CGColor, shadowRadius: CGFloat = 17, shadowOpacity: Float = 0.8) {
        layer.borderWidth = 0
        layer.shadowColor =  color
        layer.shadowOffset = CGSize(width: 0, height: 0)
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
    }
    
    func applyGradient(colors: [CGColor], cornerRadius: CGFloat = 0) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = bounds
        gradient.cornerRadius = 15
        gradient.position = center
        gradient.colors = colors
        
        layer.insertSublayer(gradient, at: 0)
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
            
        layer.bounds = CGRect(x: 0, y: 0, width: self.bounds.width, height: height)
        layer.add(animation, forKey: CATransitionType.push.rawValue)
    }
}
