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
    @Published var durationSec: Int? = 20
    @Published var isRunning: Bool = false
    
    func startTicker() {
        isRunning = true
        if let durationMin = durationMin, let durationSec = durationSec {
            print("Таймер запущен на \(durationMin) минут \(durationSec) секунд")
        }
    }
    
    func playSound() {
        let url = NSBundle.mainbundle().URLForResource
    }
}
