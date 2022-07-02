//
//  PopUpViewController.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 2.07.22.
//

import UIKit
import SnapKit

class PopUpViewController: UIViewController {
    
    // MARK: - Views
    
    private lazy var messageView: UIView = {
        let messageView = UIView()
        //messageView.frame = CGRect(x: view.bounds.midX, y: view.bounds.midY, width: view.bounds.width / 3, height: view.bounds.height / 3)
        
        return messageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
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
        messageView.backgroundColor = .systemBlue
    }
    
    func addSubviews() {
        view.addSubview(messageView)
        messageView.addSubview(titleLabel)
    }
    
    func setupLayout() {
        messageView.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
            make.width.height.equalToSuperview().multipliedBy(0.33)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerY.centerX.equalToSuperview()
        }
    }
}
