//
//  TeyemerViewModel.swift
//  Teyemer
//
//  Created by Egor Lavrentev on 22.08.25.
//

import SwiftUI
import AVFoundation

var player: AVAudioPlayer?

class TeyemerViewModel: ObservableObject {
    @Published var durationMin: Int? = 20
    @Published var durationSec: Int? = 0
    @Published var isRunning: Bool = false
    @Published var timer: Timer?
    
    func startTimer() {
        let duration = Double(durationMin! * 60 + durationSec!)
        
        timer = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(playSound), userInfo: nil, repeats: true)
        isRunning = true
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
        isRunning = false
    }
    
    func toggleTimer() {
        if isRunning {
            stopTimer()
            return
        }
        startTimer()
    }
    
    @objc func playSound() {
        if let path = Bundle.main.path(forResource: "metal-pipe.mp3", ofType: nil) {
            
            let url = URL(fileURLWithPath: path)
            
            do {
                try player = AVAudioPlayer(contentsOf: url)
                player?.play()

            } catch let error as NSError {
                print("audioPlayer error \(error.localizedDescription)")
            }
        }
    }
}
