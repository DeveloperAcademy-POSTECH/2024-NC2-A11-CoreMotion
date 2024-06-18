//
//  MotionManager.swift
//  NC2-0 Watch App
//
//  Created by 이진 on 6/17/24.
//

import Foundation
import CoreMotion
import Combine

class MotionManager: ObservableObject {
    private var pedometer = CMPedometer()
    @Published var timer: Timer?
    private var startTime: Date?
    @Published var runningPace: Double = 0.0
    @Published var distanceTraveled: Double = 0.0
    @Published var runningMic: Int = 0
    @Published var runningSec: Int = 0
    @Published var runningMin: Int = 0
    
    func startRunning() {
        startTime = Date()
        distanceTraveled = 0.0

        if CMPedometer.isDistanceAvailable() && CMPedometer.isPaceAvailable() {
            pedometer.startUpdates(from: startTime!) { [weak self] data, error in
                guard let self = self, let data = data, error == nil else {
                    print("Pedometer error: \(String(describing: error))")
                    return
                }

                if let distance = data.distance?.doubleValue {
                    self.distanceTraveled = distance / 1000.0 // Convert meters to kilometers
                }

                if let currentPace = data.currentPace?.doubleValue {
                    let paceInSecondsPerMeter = currentPace
                    let paceInSecondsPerKilometer = paceInSecondsPerMeter * 1000
                    DispatchQueue.main.async {
                        self.runningPace = paceInSecondsPerKilometer / 60.0 // Convert seconds to minutes
                    }
                }
            }
        }

        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            self.updateRunningPace()
        }
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { _ in
            self.runningMic += 1
            if self.runningMic == 99 {
                self.runningMic = 0
                self.runningSec += 1
            }
            if self.runningSec == 59 {
                self.runningSec = 0
                self.runningMin += 1
            }
        }
        
    }

    func stopRunning() {
        pedometer.stopUpdates()
        timer?.invalidate()
        timer = nil
    }

    private func updateRunningPace() {
        guard let startTime = startTime else { return }
        let elapsedTime = Date().timeIntervalSince(startTime)

        if distanceTraveled > 0 {
            let pace = elapsedTime / distanceTraveled // seconds per km
            DispatchQueue.main.async {
                self.runningPace = pace / 60.0 // Convert seconds to minutes
            }
        }
    }
}
