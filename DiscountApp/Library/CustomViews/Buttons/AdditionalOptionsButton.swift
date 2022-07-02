//
//  AdditionalOptionsButton.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 29.06.22.
//

import UIKit

final class AdditionalOptionsButton: UIButton {
   
    // MARK: - Initialization and deinitialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Appearance methods

private extension AdditionalOptionsButton {
    func setupAppearance() {
        setTitleColor(.gray, for: .normal)
        let fontSize = CGFloat(UIDevice.current.userInterfaceIdiom == .pad ? 14 : 10).adaptedFontSize
        titleLabel?.font = .systemFont(ofSize: fontSize, weight: .regular)
        titleLabel?.adjustsFontForContentSizeCategory = true
    }
}

