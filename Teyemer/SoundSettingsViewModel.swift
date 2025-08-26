//
//  TeyemerViewModel.swift
//  Teyemer
//
//  Created by Egor Lavrentev on 22.08.25.
//

import SwiftUI

class SoundSettingsViewModel: ObservableObject {
    @Published var sounds: [String] = []
    
    func getSoundList() {
        if let path = Bundle.main.resourcePath {
            do {
                sounds = try FileManager.default.contentsOfDirectory(atPath: path)
            } catch {
                print("Ошибка \(error)")
            }
        }
    }
}
