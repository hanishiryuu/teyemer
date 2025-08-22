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
                    TextField("Minutes", text: $durationMinStr)
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
                    TextField("Seconds", text: $durationSecStr)
                        .frame(width: 80)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .onChange(of: durationSecStr) { oldVal, newVal in
                            viewModel.durationSec = Int(newVal) ?? 0
                        }
                }
            }
            
            Button(action: {
                viewModel.isRunning = !viewModel.isRunning
            }) {
                if viewModel.isRunning {
                    Text("Stop Teyemer")
                } else {
                    Text("Start Teyemer")
                }
                
            }
            
            Text("Teyemer!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
