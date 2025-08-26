//
//  TeyemerApp.swift
//  Teyemer
//
//  Created by Egor Lavrentev on 22.08.25.
//

import SwiftUI

@main
struct TeyemerApp: App {
    var body: some Scene {
        WindowGroup("Teyemer") {
            ContentView()
        }
        
        #if os(macOS)
        Settings {
            SoundSettingsView()
                .frame(minWidth: 300, minHeight: 200)
        }
        #endif
    }
}
