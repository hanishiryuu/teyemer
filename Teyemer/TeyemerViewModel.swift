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
    @AppStorage("sound") var selectedSound: String = "metal-pipe.mp3"

    func startTimer() {
        let duration = Double(durationMin! * 60 + durationSec!)

        timer = Timer.scheduledTimer(timeInterval: duration, target: self, selector: #selector(playSoundWithName), userInfo: nil, repeats: true)
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
    
    @objc func playSoundWithName() {
        playSound(filename: selectedSound)
    }

    func playSound(filename: String) {
        if let path = Bundle.main.path(forResource: filename, ofType: nil) {
            let url = URL(fileURLWithPath: path)
            do {
                try player = AVAudioPlayer(contentsOf: url)
                player?.play()
            } catch {
                print("audioPlayer error \(error.localizedDescription)")
            }
        }
    }
}
