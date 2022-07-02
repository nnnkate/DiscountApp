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
    
    private let isPad = UIDevice.current.userInterfaceIdiom == .pad
    
    // MARK: - Views
    
    private lazy var backgroundView: UIView = {
        var backgroundView = UIView()
        backgroundView.backgroundColor = .black
        backgroundView.alpha = 0
        
        return backgroundView
    }()
    
    private lazy var alertView: UIView = {
        let alertView = UIView()
        alertView.layer.cornerRadius = 12
        //alertStacktView.spacing = 5
        
        alertView.backgroundColor = .getCustomDarkBlueColor()
        
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
        messageLabel.text = "Offer activated at"
        
        return messageLabel
    }()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        setupLayout()
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
        alertView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.38)
            make.height.equalTo(alertView.snp.width).multipliedBy(0.4)
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
