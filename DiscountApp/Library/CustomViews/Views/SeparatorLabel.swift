//
//  SeparatorLabel.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 1.07.22.
//

import UIKit

class SeparatorLabel: UILabel {
    
    // MARK: - Initialization and deinitialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Appearance methods

private extension SeparatorLabel {
    func setupAppearance() {
        font = .systemFont(ofSize: 15, weight: .bold)
        textColor = .white
        text = ":"
        adjustsFontSizeToFitWidth = true
        minimumScaleFactor = 0.5
        numberOfLines = 1
        
        setContentHuggingPriority(.required, for: .horizontal)
        setContentCompressionResistancePriority(.required, for: .horizontal)
    }
}
