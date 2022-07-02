//
//  RoundedButton.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 29.06.22.
//

import UIKit

final class RoundedButton: UIButton {
    
    // MARK: - Initialization and deinitialization
    
    init(color: CGColor, cornerRadius: CGFloat = 12, width: CGFloat, height: CGFloat, applyGradient: Bool = true) {
        super.init(frame: .zero)
        
        self.setupAppearance(color: color, cornerRadius: cornerRadius, width: width, height: height, applyGradient: applyGradient)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Appearance methods

private extension RoundedButton {
    func setupAppearance(color: CGColor, cornerRadius: CGFloat, width: CGFloat, height: CGFloat, applyGradient: Bool) {
        frame = CGRect(x: 0, y: 0, width: width, height: height)
        layer.cornerRadius = cornerRadius

        addShadow(color: color)
        
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)

        if applyGradient {
            self.applyGradient(colors: [UIColor.getCustomBlueColor().cgColor,
                                        UIColor.getCustomPinkColor().cgColor],
                               cornerRadius: cornerRadius)
        }
    }
}


