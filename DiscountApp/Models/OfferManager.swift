//
//  OfferManager.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 3.07.22.
//

import Foundation

final class OfferManager {
   
    // MARK: - Public properties
    
    weak var delegate: OfferManagerDelegate?
    
    // MARK: - Private properties
    
    private lazy var isActivated = false {
        didSet {
            cancelTimer()
        }
    }
    
    private lazy var timerManager: TimerManager = {
        let timerManager = TimerManager()
        timerManager.delegate = self
        
        return timerManager
    }()
    
   // MARK: - Public methods
    
    func activateOffer() {
        isActivated = true
    }
}

// MARK: - TimerManagerDelegate

extension OfferManager: TimerManagerDelegate {
    func updateTimer(_ timerCounter: Int) {
        delegate?.updateTimer(timerCounter)
    }
    
    func startTimer() {
        timerManager.startTimer()
    }
    
    func cancelTimer() {
        timerManager.cancelTimer()
    }
}
