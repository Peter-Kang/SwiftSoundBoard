//
//  ContentView.swift
//  SwiftSoundBoard
//
//  Created by Peter Kang on 7/8/24.
//

import SwiftUI
import AVFoundation


struct ContentView: View {
    @State var audioPlayer: AVAudioPlayer!
    
    func playSounds(_ soundFileName : String) {
        guard let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: ".mp3") else {
                   fatalError("Unable to find \(soundFileName) in bundle")
               }

               do {
                   audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
               } catch {
                   print(error.localizedDescription)
               }
               audioPlayer.play()
    }
    
    var body: some View {
        VStack {
            Button {
                playSounds("shadowheart-ignis")
            }label:{
                Image("Shadowheart")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
            }
        }
        .padding()
    }
    
}

#Preview {
    ContentView()
}
