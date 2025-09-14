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
    @Published var expireDate: String
    @Published var points: Int
    
    let player: AVPlayer
    
    init(tier: TagType, expireDate: String, points: Int) {
        self.tier = tier
        self.expireDate = expireDate
        self.player = AVPlayer(url: Bundle.main.url(forResource: tier.videoTitle, withExtension: "mp4")!)
        self.points = points
    }
    
    func playVideo() {
        player.play()
    }
    
    func setShowingSheet(_ value: Bool) {
        showingSheet = value
    }
}
