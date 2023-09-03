//
//  AudioHelper.swift
//  DoubleDash
//
//  Created by Minh Vo on 04/09/2023.
//

import SwiftUI
import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSoundEffect(named soundFileName: String) {
    if let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
            audioPlayer?.play()
        } catch {
            print("Error playing sound: \(error)")
        }
    }
}
