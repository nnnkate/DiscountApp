//
//  OfferActivatedViewController.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 2.07.22.
//

import UIKit
import SnapKit

class OfferActivatedViewController: UIViewController {
    
    // MARK: - Private properties
    
    private var activationTimeComponent: TimeComponents
    
    // MARK: - Views
    
    private lazy var backgroundView: UIView = {
        var backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0.6
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleBackgroundTap))
        backgroundView.addGestureRecognizer(tapGestureRecognizer)
        
        return backgroundView
    }()
    
    private lazy var alertView: UIView = {
        let alertView = UIView()
        alertView.backgroundColor = .getCustomDarkBlueColor()
        alertView.layer.cornerRadius = 12
        
        return alertView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        let fontSize = CGFloat(isPad ? 45 : 30).adaptedFontSize
        titleLabel.font = .systemFont(ofSize: fontSize, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.text = "Great!"
        
        titleLabel.addShadow(color: UIColor.white.cgColor, shadowRadius: 7, shadowOpacity: 0.5)
        
        return titleLabel
    }()
    
    private lazy var messageLabel: UILabel = {
        let messageLabel = UILabel()
        let fontSize = CGFloat(isPad ? 12 : 18).adaptedFontSize
        messageLabel.font = .systemFont(ofSize: fontSize, weight: .regular)
        messageLabel.textColor = .white
        messageLabel.text = "Offer activated at \(getActivationTimeString())"
        
        return messageLabel
    }()
    
    // MARK: - Initialization and deinitialization
    
    init(activationTimeComponent: TimeComponents) {
        self.activationTimeComponent = activationTimeComponent
        
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupLayout()
    }
    
    func getActivationTimeString() -> String {
        let activationTimeComponentArray = [activationTimeComponent.days, activationTimeComponent.hours, activationTimeComponent.minutes]
       
        var activationTimeComponentString = activationTimeComponentArray.reduce("") {
            $0 + ($1 != 0 ? String(format: "%02d", $1) + ":" : "")
        }
        
        activationTimeComponentString += String(format: "%02d", activationTimeComponent.seconds)
        
        return activationTimeComponentString
    }
}

// MARK: - Appearance methods

private extension OfferActivatedViewController {
    func addSubviews() {
        view.addSubview(backgroundView)
        
        view.addSubview(alertView)
        alertView.addSubview(titleLabel)
        alertView.addSubview(messageLabel)
    }
    
    func setupLayout() {
        backgroundView.snp.makeConstraints { make in
            make.top.leading.centerY.centerX.equalToSuperview()
        }
        
        alertView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.38)
            make.height.equalTo(alertView.snp.width).multipliedBy(0.47)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(alertView.snp.centerY)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(alertView.snp.centerY).offset(10.verticalAdapted)
        }
    }
}

// MARK: - Actions

private extension OfferActivatedViewController {
    @objc func handleBackgroundTap() {
        self.dismiss(animated: true, completion: nil)
    }
}
