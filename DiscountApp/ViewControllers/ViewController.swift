//
//  ViewController.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 29.06.22.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Private properties
    
    private lazy var timerManager: TimerManager = {
        let timerManager = TimerManager()
        timerManager.delegate = self
        
        return timerManager
    }()
    
    private let isPad = UIDevice.current.userInterfaceIdiom == .pad
    
    private lazy var activateOfferButtonWidth: CGFloat = {
        return (isPad ? 403 : 300).verticalAdapted
    }()
    
    private lazy var  activateOfferButtonHeight: CGFloat = {
        return (isPad ? 88 : 63).verticalAdapted
    }()
    
    // MARK: - Views
    
    private lazy var  closeButton: UIButton = {
        var closeButton = UIButton()
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.imageView?.tintColor = .darkGray
        
        return closeButton
    }()
    
    private lazy var musicImageView: UIImageView = {
        let musicImageView = UIImageView(image: UIImage(named: "music"))
        musicImageView.contentMode = .scaleAspectFit
        
        return musicImageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "LAST-MINUTE CHANCE!\nto claim your offer"
        let fontSize = CGFloat(isPad ? 35 : 22).adaptedFontSize
        descriptionLabel.font = .systemFont(ofSize: fontSize, weight: .semibold)
        descriptionLabel.textColor = .white
        descriptionLabel.numberOfLines = 2
        descriptionLabel.textAlignment = .center
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.minimumScaleFactor = 0.5
        
        return descriptionLabel
    }()
    
    private lazy var discountLabel: UILabel = {
        let discountLabel = UILabel()
        discountLabel.text = "90% OFF"
        let fontSize = CGFloat(isPad ? 80 : 55).adaptedFontSize
        discountLabel.font = .systemFont(ofSize: fontSize, weight: .black)
        discountLabel.textColor = .white
        discountLabel.numberOfLines = 1
        discountLabel.textAlignment = .center
        discountLabel.adjustsFontSizeToFitWidth = true
        discountLabel.minimumScaleFactor = 0.5
        
        return discountLabel
    }()
    
    private lazy var targetLabel: UILabel = {
        let targetLabel = UILabel()
        targetLabel.text = "For true music fans"
        let fontSize = CGFloat(isPad ? 20 : 15).adaptedFontSize
        targetLabel.font = .systemFont(ofSize: fontSize, weight: .semibold)
        targetLabel.textColor = .white
        targetLabel.numberOfLines = 1
        targetLabel.textAlignment = .center
        targetLabel.adjustsFontSizeToFitWidth = true
        targetLabel.minimumScaleFactor = 0.5
        
        return targetLabel
    }()
    
    private lazy var timerStackView: TimerStackView = {
        let timerStackView = TimerStackView()
        
        return timerStackView
    }()
    
    private lazy var contentInformationLabel: UILabel = {
        let contentInformationLabel = UILabel()
        contentInformationLabel.text = "Hundreds of songs in your pocket"
        let fontSize = CGFloat(isPad ? 18 : 14).adaptedFontSize
        contentInformationLabel.font = .systemFont(ofSize: fontSize, weight: .regular)
        contentInformationLabel.textColor = .gray
        contentInformationLabel.numberOfLines = 1
        contentInformationLabel.textAlignment = .center
        contentInformationLabel.adjustsFontSizeToFitWidth = true
        contentInformationLabel.minimumScaleFactor = 0.5
        
        return contentInformationLabel
    }()
    
    private lazy var activateOfferButton: RoundedButton = {
        let activateOfferButton = RoundedButton(width: activateOfferButtonWidth, height: activateOfferButtonHeight)
        activateOfferButton.setTitle("ACTIVATE OFFER", for: .normal)
        let action = UIAction { [weak self] _ in self?.handleActivateOfferButton() }
        activateOfferButton.addAction(action, for: .touchUpInside)
        
        return activateOfferButton
    }()
    
    private lazy var additionalOptionsStackView: UIStackView = {
        let additionalOptions = UIStackView()
        additionalOptions.axis = .horizontal
        additionalOptions.distribution = .fill
        additionalOptions.spacing = 10
        
        return additionalOptions
    }()
    
    private lazy var privacyButton: AdditionalOptionsButton = {
        let privacyButton = AdditionalOptionsButton()
        privacyButton.setTitle("Privacy", for: .normal)
        
        return privacyButton
    }()
    
    private lazy var restoreButton: AdditionalOptionsButton = {
        let restoreButton = AdditionalOptionsButton()
        restoreButton.setTitle("Restore", for: .normal)
        
        return restoreButton
    }()
    
    private lazy var termsButton: AdditionalOptionsButton = {
        let termsButton = AdditionalOptionsButton()
        termsButton.setTitle("Terms", for: .normal)
        
        return termsButton
    }()
    
    // MARK: - UIViewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
        addSubviews()
        setupLayout()
        
        timerManager.startTimer()
    }
}

// MARK: - Appearance methods

private extension ViewController {
    
    func setupAppearance() {
        view.backgroundColor = .black
    }
    
    func addSubviews() {
        
        view.addSubview(closeButton)
        view.addSubview(musicImageView)
        
        view.addSubview(titleLabel)
        view.addSubview(discountLabel)
        view.addSubview(targetLabel)
        
        view.addSubview(timerStackView)
        
        view.addSubview(contentInformationLabel)
        
        view.addSubview(activateOfferButton)
        
        view.addSubview(additionalOptionsStackView)
        additionalOptionsStackView.addArrangedSubview(privacyButton)
        additionalOptionsStackView.addArrangedSubview(restoreButton)
        additionalOptionsStackView.addArrangedSubview(termsButton)
    }
    
    func setupLayout() {
        closeButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10.verticalAdapted)
            make.leading.equalToSuperview().offset(10.horizontalAdapted)
        }
        
        musicImageView.snp.makeConstraints { make in
            make.top.centerY.equalToSuperview()
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.snp.centerX)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalTo(activateOfferButton.snp.centerX)
            make.width.equalTo(activateOfferButtonWidth)
            //make.bottom.equalTo(discountLabel.snp.top).offset(-12.verticalAdapted)
        }
        
        discountLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12.horizontalAdapted)
            make.centerX.equalTo(activateOfferButton.snp.centerX)
            make.width.equalTo(activateOfferButtonWidth)
            //make.bottom.equalTo(targetLabel.snp.top).offset(-8.verticalAdapted)
        }
        
        targetLabel.snp.makeConstraints { make in
            make.top.equalTo(discountLabel.snp.bottom).offset(8.verticalAdapted)
            make.centerX.equalTo(activateOfferButton.snp.centerX)
            make.width.equalTo(activateOfferButtonWidth)
            make.bottom.equalTo(timerStackView.snp.top).offset(-20.verticalAdapted)
        }
        
        timerStackView.snp.makeConstraints { make in
            make.height.equalTo((isPad ? 57 : 41).horizontalAdapted)
            make.centerX.equalTo(activateOfferButton.snp.centerX)
            make.width.equalTo(activateOfferButtonWidth)
            make.bottom.equalTo(contentInformationLabel.snp.top).offset(-16.verticalAdapted)
        }
        
        contentInformationLabel.snp.makeConstraints { make in
            //make.top.equalTo(timerStackView.snp.bottom).offset(16.verticalAdapted)
            make.centerX.equalTo(activateOfferButton.snp.centerX)
            make.width.equalTo(activateOfferButtonWidth)
           // make.bottom.equalTo(activateOfferButton.snp.top).offset(-10.verticalAdapted)
        }
        
        activateOfferButton.snp.makeConstraints { make in
            make.top.equalTo(contentInformationLabel.snp.bottom).offset(10.verticalAdapted)
            make.height.equalTo(63.verticalAdapted)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-(isPad ? 95 : 20).horizontalAdapted)
            make.width.equalTo(activateOfferButtonWidth)
            //make.bottom.equalTo(additionalOptionsStackView.snp.top).offset(-20.verticalAdapted)
        }
        
       additionalOptionsStackView.snp.makeConstraints { make in
            make.top.equalTo(activateOfferButton.snp.bottom).offset(20.verticalAdapted)
            make.centerX.equalTo(activateOfferButton.snp.centerX)
            //make.height.equalTo(10.verticalAdapted)
            make.bottom.equalToSuperview().offset(-30.verticalAdapted)
        }
    }
}

// MARK: - TimerManagerDelegate

extension ViewController: TimerManagerDelegate {
    func updateTimer(_ timerCounter: Int) {
        timerStackView.updadeTimerComponents(with: timerCounter.getTimerComponents())
    }
    
    func cancelTimer() {
        timerManager.cancelTimer()
    }
}

// MARK: - Actions

private extension ViewController {
    func handleActivateOfferButton() {
        cancelTimer()
        
        showPopUpViewController()
    }
}

// MARK: - PopUpViewController

extension ViewController {
    func showPopUpViewController() {
        let popUpViewController = PopUpViewController()
        self.addChild(popUpViewController)
        popUpViewController.view.frame = self.view.frame
        self.view.addSubview(popUpViewController.view)
    }
}


