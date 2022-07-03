//
//  OfferViewController.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 29.06.22.
//

import UIKit
import SnapKit

class OfferViewController: UIViewController {
    
    // MARK: - Private properties
    
    private let isPad = UIDevice.current.userInterfaceIdiom == .pad
    
    private lazy var offerManager: OfferManager = {
        let offerManager = OfferManager()
        offerManager.delegate = self

        return offerManager
    }()
    
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
        closeButton.tintColor = .darkGray
        
        return closeButton
    }()
    
    private lazy var musicImageView: UIImageView = {
        let musicImageView = UIImageView(image: UIImage(named: "music"))
        musicImageView.contentMode = .scaleAspectFit
        
        return musicImageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "LAST-MINUTE CHANCE!\nto claim your offer"
        let fontSize = CGFloat(isPad ? 35 : 22).adaptedFontSize
        titleLabel.font = .systemFont(ofSize: fontSize, weight: .semibold)
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.minimumScaleFactor = 0.5
        
        return titleLabel
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
        let activateOfferButton = RoundedButton(color: UIColor.getCustomPinkColor().cgColor,
                                                width: activateOfferButtonWidth,
                                                height: activateOfferButtonHeight)
        activateOfferButton.setTitle("ACTIVATE OFFER", for: .normal)
        let action = UIAction { [weak self] _ in self?.handleActivateOfferButton() }
        activateOfferButton.addAction(action, for: .touchUpInside)
        
        return activateOfferButton
    }()
    
    private lazy var additionalOptionsStackView: UIStackView = {
        let additionalOptionsStackView = UIStackView()
        additionalOptionsStackView.axis = .horizontal
        additionalOptionsStackView.distribution = .fill
        additionalOptionsStackView.spacing = 10.verticalAdapted
        
        return additionalOptionsStackView
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
        
        offerManager.startTimer()
    }
}

// MARK: - Appearance methods

private extension OfferViewController {
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
            make.centerX.equalTo(activateOfferButton.snp.centerX)
            make.width.equalTo(activateOfferButtonWidth)
        }
        
        discountLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(12.verticalAdapted)
            make.centerX.equalTo(activateOfferButton.snp.centerX)
            make.width.equalTo(activateOfferButtonWidth)
        }
        
        targetLabel.snp.makeConstraints { make in
            make.top.equalTo(discountLabel.snp.bottom).offset(8.verticalAdapted)
            make.centerX.equalTo(activateOfferButton.snp.centerX)
            make.width.equalTo(activateOfferButtonWidth)
            make.bottom.equalTo(timerStackView.snp.top).offset(-20.verticalAdapted)
        }
        
        timerStackView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.centerY)
            make.height.equalTo((isPad ? 57 : 41).horizontalAdapted)
            make.centerX.equalTo(activateOfferButton.snp.centerX)
            make.width.equalTo(activateOfferButtonWidth)
        }
        
        contentInformationLabel.snp.makeConstraints { make in
            make.top.equalTo(timerStackView.snp.bottom).offset(16.verticalAdapted)
            make.centerX.equalTo(activateOfferButton.snp.centerX)
            make.width.equalTo(activateOfferButtonWidth)
        }
        
        activateOfferButton.snp.makeConstraints { make in
            make.top.equalTo(contentInformationLabel.snp.bottom).offset(10.verticalAdapted)
            make.height.equalTo((isPad ? 88 : 63).verticalAdapted)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing).offset(-(isPad ? 95 : 20).horizontalAdapted)
            make.width.equalTo(activateOfferButtonWidth)
        }
        
       additionalOptionsStackView.snp.makeConstraints { make in
            make.top.equalTo(activateOfferButton.snp.bottom).offset(20.verticalAdapted)
            make.centerX.equalTo(activateOfferButton.snp.centerX)
        }
    }
}

// MARK: - TimerDelegate

extension OfferViewController: TimerDelegate {
    func updateTimer(_ timerCounter: Int) {
        timerStackView.updadeTimeComponents(with: timerCounter.getTimeComponents())
    }
}

// MARK: - Actions

private extension OfferViewController {
    func handleActivateOfferButton() {
        if offerManager.getTimerCounter() == 0 { return }
        
        offerManager.activateOffer { [weak self] activationCounter in
            self?.showOfferActivatedViewController(activationCounter)
        }
    }
}

// MARK: - OfferActivatedViewController

private extension OfferViewController {
    func showOfferActivatedViewController(_ activationCounter: Int) {
        let activationTimeComponent = activationCounter.getTimeComponents()
        let offerActivatedViewController = OfferActivatedViewController(activationTimeComponent: activationTimeComponent)
        offerActivatedViewController.modalPresentationStyle = .overCurrentContext
        offerActivatedViewController.modalTransitionStyle = .crossDissolve
        
        self.navigationController?.present(offerActivatedViewController, animated: true)
    }
}

