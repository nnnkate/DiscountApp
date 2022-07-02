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
        
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Appearance methods

private extension AdditionalOptionsButton {
    func setupAppearance() {
        setTitleColor(.gray, for: .normal)
        titleLabel?.adjustsFontForContentSizeCategory = true
        titleLabel?.font = .systemFont(ofSize: 10, weight: .regular)
    }
}

