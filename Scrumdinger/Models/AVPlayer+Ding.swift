//
//  AVPlayer+Ding.swift
//  Scrumdinger
//
//  Created by Edgar Montero on 12/31/24.
//

import AVFoundation

class AudioPlayer {
    static let sharedDingPlayer: AVPlayer = {
        let url = Bundle.main.url(forResource: "ding", withExtension: "mp3")! // Replace with your sound file
        return AVPlayer(url: url)
    }()
}


extension AVPlayer {
    static let sharedDingPlayer: AVPlayer = {
        guard let url = Bundle.main.url(forResource: "ding", withExtension: "wav") else { fatalError("Failed to find sound file.") }
        return AVPlayer(url: url)
    }()
}
