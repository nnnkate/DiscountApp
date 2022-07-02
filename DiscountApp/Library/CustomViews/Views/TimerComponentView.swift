//
//  TimerComponentView.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 30.06.22.
//

import UIKit

class TimerComponentView: UIView {
    
    // MARK: - Private properties
    
    private lazy var valueLabel: UILabel = {
       let valueLabel = UILabel()
        let fontSize = CGFloat(UIDevice.current.userInterfaceIdiom == .pad ? 22 : 15).adaptedFontSize
        valueLabel.font = .systemFont(ofSize: fontSize, weight: .bold)
        valueLabel.adjustsFontSizeToFitWidth = true
        valueLabel.minimumScaleFactor = 0.5
        valueLabel.numberOfLines = 1
        valueLabel.textColor = .white
        valueLabel.textAlignment = .center
        valueLabel.text = "00"
        
        
        return valueLabel
    }()
    
    // MARK: - Initialization and deinitialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.setupAppearance()
        self.addSubviews()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Appearance methods

private extension TimerComponentView {
    func setupAppearance() {
        layer.cornerRadius = 12
        backgroundColor = .darkGray
    }
    
    func addSubviews() {
        addSubview(valueLabel)
    }
    
    func setupLayout() {
        valueLabel.snp.makeConstraints { make in
            make.top.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - Update methods

extension TimerComponentView {
    func updateValueLabel(with newValue: Int) {
        let newValueString = String(format: "%02d", newValue)
        if valueLabel.text != newValueString {
            valueLabel.text = newValueString
            valueLabel.transitionAnimation()
        }
    }
}

