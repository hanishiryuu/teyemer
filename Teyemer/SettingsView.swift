import SwiftUI

struct SettingsView: View {
    var body: some View {
        TabView {
            SoundSettingsView()
                .tabItem {
                    Label("Sound", systemImage: "speaker.wave.2.fill")
                }
        }
    }
}
