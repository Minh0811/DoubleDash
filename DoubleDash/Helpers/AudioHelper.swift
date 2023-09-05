//
//  AudioHelper.swift
//  DoubleDash
//
//  Created by Minh Vo on 04/09/2023.
//

import SwiftUI
import AVFoundation

// Global instance of the audio player used to play sound effects.
var audioPlayer: AVAudioPlayer?

/// - Parameter soundFileName: The name of the sound file (without its extension) to be played.
func playSoundEffect(named soundFileName: String) {
    // Attempt to retrieve the URL for the sound file from the main bundle.
       if let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) {
           do {
               // Initialize the audio player with the sound file's URL.
               audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
               // Play the sound effect.
               audioPlayer?.play()
           } catch {
               // Print any errors that occur during audio player initialization or playback.
               print("Error playing sound: \(error)")
           }
       }
}
