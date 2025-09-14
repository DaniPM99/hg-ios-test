//
//  HomeViewModel.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 14/9/25.
//

import Foundation
import AVFoundation

final class HomeViewModel: ObservableObject {
    @Published var userName: String = "ARTURO CASAS"
    @Published var points: Float = Float.random(in: 0...200)
    @Published var greenInsignias: Float = Float.random(in: 0...10)
    @Published var beansInsignias: Float = Float.random(in: 0...10)
    @Published var expireDate: Date = Date()
    let player: AVPlayer
    
    init() {
        let url = Bundle.main.url(forResource: "legendLoop", withExtension: "mp4")!
        self.player = AVPlayer(url: url)
        
        // Loop automático
        NotificationCenter.default.addObserver(
            forName: .AVPlayerItemDidPlayToEndTime,
            object: player.currentItem,
            queue: .main
        ) { [weak player] _ in
            player?.seek(to: .zero)
            player?.play()
        }
    }
    
    func playVideo() {
        player.seek(to: .zero)
        player.play()
    }
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        return formatter
    }

    var tier: TagType {
        if points >= 0 && points < 20 {
            return .bronze
        } else if points >= 20 && points < 50 {
            return .silver
        } else if points >= 50 && points < 100 {
            return .gold
        } else {
            return .emerald
        }
    }
    
    func normalizedProgress() -> Float {
        switch points {
        case ..<20:
            // Starter (0) → Champ (1)
            return (points / 20) * 1
        case 20..<50:
            // Champ (1) → Star (2)
            return 1 + (points - 20) / 30
        case 50..<100:
            // Star (2) → Legend (3)
            return 2 + (points - 50) / 50
        default:
            // 100–125 → ya en Legend (3)
            return 3
        }
    }
    
    func normalizedProgressSecondPhase() -> Float {
        if points < 125 {
            // antes de empezar la segunda barra → en el inicio (0)
            return 0
        } else if points >= 200 {
            // todo lo que sea 200 o más → en el final (1)
            return 1
        } else {
            // mapear 125–200 → 0–1
            return (points - 125) / 75
        }
    }
    
    func operatePoints(operation: String) {
        if operation == "-" {
            if self.points > 10 {
                self.points -= 10
            }
        } else {
            if self.points < 190 {
                self.points += 10
            } else if self.points >= 190 || self.points < 200 {
                let difference = 200 - self.points
                self.points += difference
            }
        }
    }
}
