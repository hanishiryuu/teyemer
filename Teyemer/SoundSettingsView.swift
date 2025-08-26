import SwiftUI

struct SoundSettingsView: View {
    @StateObject private var viewModel: SoundSettingsViewModel
    @StateObject private var teyemerViewModel: TeyemerViewModel
    @State private var files: [String] = []
    @AppStorage("sound") var selectedSound: String = "metal-pipe.mp3"
    
    init() {
        let vm = SoundSettingsViewModel()
        _viewModel = StateObject(wrappedValue: vm)
        vm.getSoundList()
        _files = State(initialValue: Array(vm.sounds))
        
        let tvm = TeyemerViewModel()
        _teyemerViewModel = StateObject(wrappedValue: tvm)
    }

    var body: some View {
        VStack {
            ForEach(files, id: \.self) { file in
                HStack {
                    Toggle(isOn: Binding(get: { selectedSound == file },
                                         set: { if $0 { selectedSound = file } }
                    )) {
                        Text(
                            file
                                .components(separatedBy: ".").first!
                                .replacingOccurrences(of: "-", with: " ")
                                .capitalized
                        )
                    }
                    .toggleStyle(.checkbox)
                    
                    Button {
                        teyemerViewModel.playSound(filename: file)
                    } label: {
                        Text("🥀")
                    }
                        
                }
            }
        }
    }
}
