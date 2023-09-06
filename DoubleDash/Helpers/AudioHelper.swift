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
// Dictionary to hold audio players for different sounds
var audioPlayers: [String: AVAudioPlayer] = [:]

func playSoundEffect(named soundFileName: String) {
    // If there's an existing player for this sound, stop it.
    if let existingPlayer = audioPlayers[soundFileName], existingPlayer.isPlaying {
        existingPlayer.stop()
        existingPlayer.currentTime = 0
    }
    
    // Attempt to retrieve the URL for the sound file from the main bundle.
    if let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: nil) {
        do {
            print("played: \(soundFileName)")
            
            // If there's no existing player for this sound, create one.
            if audioPlayers[soundFileName] == nil {
                let newPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayers[soundFileName] = newPlayer
            }
            
            // Play the sound effect.
            audioPlayers[soundFileName]?.play()
        } catch {
            // Print any errors that occur during audio player initialization or playback.
            print("Error playing sound: \(error)")
        }
    }
}


