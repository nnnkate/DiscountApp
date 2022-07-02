//
//  TimerStackView.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 30.06.22.
//

import UIKit

class TimerStackView: UIStackView {
    
    // MARK: - Private properties
    
    private let daysComponent = TimerComponentView()
    private let hoursComponent = TimerComponentView()
    private let minutesComponent = TimerComponentView()
    private let secondsComponent = TimerComponentView()
    
    // MARK: - Initialization and deinitialization
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        self.setupAppearance()
        self.addSubviews()
        self.setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - Appearance methods

private extension TimerStackView {
    func setupAppearance() {
        distribution = .fillProportionally
        axis = .horizontal
        spacing = 5
    }
    
    func addSubviews() {
        addArrangedSubview(daysComponent)
        addArrangedSubview(SeparatorLabel())
        addArrangedSubview(hoursComponent)
        addArrangedSubview(SeparatorLabel())
        addArrangedSubview(minutesComponent)
        addArrangedSubview(SeparatorLabel())
        addArrangedSubview(secondsComponent)
    }
    
    func setupLayout() {
        hoursComponent.snp.makeConstraints { make in
            make.width.equalTo(daysComponent.snp.width)
        }
        
        minutesComponent.snp.makeConstraints { make in
            make.width.equalTo(daysComponent.snp.width)
        }
        
        secondsComponent.snp.makeConstraints { make in
            make.width.equalTo(daysComponent.snp.width)
        }
    }
}

// MARK: - Timer update methods

extension TimerStackView {
    func updadeTimerComponents(with components: TimerComponents) {
        daysComponent.updateValueLabel(with: components.0)
        hoursComponent.updateValueLabel(with: components.1)
        minutesComponent.updateValueLabel(with: components.2)
        secondsComponent.updateValueLabel(with: components.3)
    }
}
