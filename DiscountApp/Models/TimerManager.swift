//
//  TimerManager.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 30.06.22.
//

import Foundation

final class TimerManager {
    
    // MARK: - Public properties
    
    weak var delegate: TimerDelegate?
    
    // MARK: - Private properties
    
    private var timer = Timer()
    private let timerCounterInitialValue = 24 * 60 * 60
    private(set) lazy var timerCounter = timerCounterInitialValue
}

// MARK: - Timer manipulations methods

extension TimerManager {
    func startTimer() {
        timerCounter = timerCounterInitialValue
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(timerAction),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func cancelTimer() {
        if timer.isValid {
            timer.invalidate()
        }
    }
}

// MARK: - Actions

private extension TimerManager {
    @objc func timerAction() {
        timerCounter -= 1
        
        if timerCounter == 0 {
            cancelTimer()
        }
        
        delegate?.updateTimer(timerCounter)
    }
}
