//
//  PopUpViewController.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 2.07.22.
//

import UIKit
import SnapKit

class PopUpViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let isPad = UIDevice.current.userInterfaceIdiom == .pad
    
    // MARK: - Views
    
    private lazy var messageView: UIView = {
        let messageView = UIView()
        messageView.layer.cornerRadius = 12
        //messageView.frame = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: view.bounds.width / 3, height: view.bounds.height / 3)
        messageView.backgroundColor = .getCustomDarkBlueColor()
        
        return messageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        let fontSize = CGFloat(isPad ? 55 : 37).adaptedFontSize
        titleLabel.font = .systemFont(ofSize: fontSize, weight: .bold)
        titleLabel.textColor = .white
        titleLabel.text = "Great!"
        
        return titleLabel
    }()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        addSubviews()
        setupLayout()
    }
    
}

// MARK: - Appearance methods

private extension PopUpViewController {
    
    func setupAppearance() {
        
    }
    
    func addSubviews() {
        view.addSubview(messageView)
        messageView.addSubview(titleLabel)
    }
    
    func setupLayout() {
        messageView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.equalToSuperview().multipliedBy(0.38)
            make.height.equalTo(messageView.snp.width).multipliedBy(0.4)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
}
