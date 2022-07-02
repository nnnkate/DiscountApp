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
        
        setupAppearance()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Appearance methods

private extension SeparatorLabel {
    func setupAppearance() {
        self.font = .systemFont(ofSize: 15, weight: .bold)
        self.textColor = .white
        self.text = ":"
        self.adjustsFontSizeToFitWidth = true
        self.minimumScaleFactor = 0.5
        self.numberOfLines = 1
        
        self.setContentHuggingPriority(.required, for: .horizontal)
        self.setContentCompressionResistancePriority(.required, for: .horizontal)
    }
}
