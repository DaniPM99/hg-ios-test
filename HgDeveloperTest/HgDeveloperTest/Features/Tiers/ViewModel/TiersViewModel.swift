//
//  TiersViewModel.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 14/9/25.
//

import Foundation
import AVKit

final class TiersViewModel: ObservableObject {
    @Published var tier: TagType
    @Published var showingSheet = false
    let player: AVPlayer
    
    init(tier: TagType) {
        self.tier = tier
        self.player = AVPlayer(url: Bundle.main.url(forResource: tier.videoTitle, withExtension: "mp4")!)
    }
    
    func playVideo() {
        player.play()
    }
    
    func setShowingSheet(_ value: Bool) {
        showingSheet = value
    }
}
