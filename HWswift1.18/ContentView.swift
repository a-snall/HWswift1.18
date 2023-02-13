//
//  ContentView.swift
//  HWswift1.18
//
//  Created by Astrid Snäll on 2/6/23.
//




 

import SwiftUI
import AVFAudio

struct ContentView: View {
    
    @State private var messageString = "  "
    @State private var imageName = ""
    
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var lastSoundNumber = -1
    
    
    @State private var audioPlayer: AVAudioPlayer!
    var body: some View {
        VStack {
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 30)
                .padding()
            
            Spacer()
            
            
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
                .padding()
            
            
            
            Button("Show message") {
                let messages = [ "you are awesome",
                                 "you are great!",
                                 "you are fantastic",
                                 "fabulous, that is you!",
                                 "you make me smile"]
                var messageNumber = Int.random(in: 0...messages.count-1)
                while messageNumber == lastMessageNumber {
                    messageNumber = Int.random(in: 0...messages.count-1)
                }
                messageString = messages[messageNumber]
                lastMessageNumber = messageNumber
                var imageNumber = Int.random(in: 0...9)
                while imageNumber == lastImageNumber {
                    imageNumber = Int.random(in: 0...9)
                }
                imageName = "image\(imageNumber)"
                lastImageNumber = imageNumber
                
                
                var soundNumber: Int
                repeat {
                    soundNumber = Int.random(in: 0...5)
                } while soundNumber == lastSoundNumber
                lastSoundNumber = soundNumber
                let soundName = "sound\(soundNumber)"
               
                guard let soundFile = NSDataAsset(name: soundName) else
                {
                    print("😪could not read file \(soundName)")
                    return
                }
                do {
                    audioPlayer = try AVAudioPlayer(data: soundFile.data)
                    audioPlayer.play()
                } catch {
                    print("error: \(error.localizedDescription)")
                }
                
            }
            .buttonStyle(.borderedProminent)
            
        }}
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
    
    
}
