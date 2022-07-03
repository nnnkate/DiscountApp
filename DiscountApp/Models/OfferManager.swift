//
//  OfferManager.swift
//  DiscountApp
//
//  Created by Ekaterina Nedelko on 3.07.22.
//

final class OfferManager {
   
    // MARK: - Public properties
    
    weak var delegate: TimerDelegate?
    
    // MARK: - Private properties
    
    private(set) var activationCounter: Int?

    private lazy var timerManager: TimerManager = {
        let timerManager = TimerManager()
        timerManager.delegate = self
        
        return timerManager
    }()
    
   // MARK: - Public methods
    
    func activateOffer(completion: @escaping ((Int) -> ())) {
        if let activationCounter = activationCounter {
            completion(activationCounter)
            return
        }
        
        cancelTimer()
        activationCounter = getTimerCounter()
        completion(activationCounter ?? 0)
    }
}

// MARK: - TimerDelegate

extension OfferManager: TimerDelegate {
    func updateTimer(_ timerCounter: Int) {
        delegate?.updateTimer(timerCounter)
    }
    
    func startTimer() {
        timerManager.startTimer()
    }
    
    func cancelTimer() {
        timerManager.cancelTimer()
    }
    
    func getTimerCounter() -> Int {
        timerManager.timerCounter
    }
}
