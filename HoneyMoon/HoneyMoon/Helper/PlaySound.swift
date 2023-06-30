//
//  PlaySound.swift
//  HoneyMoon
//
//  Created by José Damaren on 30/06/23.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("EROR: Could not find and play the sound file!")
        }
    }
}
