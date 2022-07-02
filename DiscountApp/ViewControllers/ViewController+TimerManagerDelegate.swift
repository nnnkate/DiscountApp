//
//  ViewController+TimerManagerDelegate.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 2.07.22.
//

extension ViewController: TimerManagerDelegate {
    func updateTimer(_ timerCounter: Int) {
        timerStackView.updadeTimerComponents(with: timerCounter.getTimerComponents())
    }
    
    func cancelTimer() {
        timerManager.cancelTimer()
    }
}

