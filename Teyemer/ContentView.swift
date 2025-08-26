//
//  ContentView.swift
//  Teyemer
//
//  Created by Egor Lavrentev on 22.08.25.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel: TeyemerViewModel
    @State private var durationMinStr: String = ""
    @State private var durationSecStr: String = ""
    
    init() {
        let vm = TeyemerViewModel()
        _viewModel = StateObject(wrappedValue: vm)
        durationMinStr = String(vm.durationMin ?? 0)
        durationSecStr = String(vm.durationSec ?? 0)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Text("Minutes")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("Minutes", text: Binding(
                        get: { String(viewModel.durationMin ?? 0) },
                        set: { viewModel.durationMin = Int($0) ?? 0 }
                    ))
                    .frame(width: 80)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: durationMinStr) { oldVal, newVal in
                        viewModel.durationMin = Int(newVal) ?? 0
                    }
                }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text("Seconds")
                        .font(.caption)
                        .foregroundColor(.gray)
                    TextField("Seconds", text: Binding(
                        get: { String(viewModel.durationSec ?? 0) },
                        set: { viewModel.durationSec = Int($0) ?? 0 }
                    ))
                    .frame(width: 80)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .onChange(of: durationSecStr) { oldVal, newVal in
                        viewModel.durationSec = Int(newVal) ?? 0
                    }
                }
            }
            
            Button(action: {
                viewModel.toggleTimer()
//                if let path = Bundle.main.resourcePath {
//                    do {
//                        let sounds = try FileManager.default.contentsOfDirectory(atPath: path)
//                        for sound in sounds {
//                            print(sound)
//                        }
//                    } catch {
//                        print("Ошибка \(error)")
//                    }
//                }
                
            }) {
                if viewModel.isRunning {
                    Text("Stop Teyemer")
                } else {
                    Text("Start Teyemer")
                }
                
            }
            Button(action: {
                viewModel.playSoundWithName()
            }) {
                    Text("Play sound")               
            }
            
            if viewModel.isRunning {
                Text("Teyemer is running!")
            } else {
                Text("Teyemer!")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
