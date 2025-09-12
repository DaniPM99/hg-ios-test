//
//  TiersView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI
import AVKit
import AVFoundation

struct TiersView: View {
    @Environment(\.dismiss) var dismiss
    @State private var player = AVPlayer(url: Bundle.main.url(forResource: "starLoop", withExtension: "mp4")!)
    @State private var showLastFrame = false
    
    var body: some View {
        ZStack {
            VideoPlayer(player: player)
                .onAppear {
                    player.play()
                    // Escuchar cuando termina el vídeo
                    NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime,
                                                           object: player.currentItem,
                                                           queue: .main) { _ in
                        showLastFrame = true
                    }
                }
                .scaledToFill()
                .ignoresSafeArea()
                .offset(x:-5)
            
            VStack {
                Header(
                    title: "",
                    backButton: false,
                    closeButton: true,
                    dismiss: dismiss
                )
                .offset(x: -180, y: -10)
                Spacer()
                VStack (spacing: 32) {
                    TierTag(
                        tagStyle: .silver,
                        tierActive: false
                    )
                    Text("WELCOME\nSTARTER.")
                        .font(.hgTierTitle)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    HStack {
                        Image(systemName: "sparkle")
                            .foregroundStyle(.white)
                        Image(systemName: "sparkle")
                            .foregroundStyle(.terracota)
                        Image(systemName: "sparkle")
                            .foregroundStyle(.terracota)
                        Image(systemName: "lock.fill")
                            .foregroundStyle(.terracota)
                    }
                    Text("Say hello to our new loyalty\nprogram; Honest People.")
                        .font(.hgRewardTitle)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    HgTierButton()
                }
            }
            .padding(Spacing.xl)
        }
    }
}

struct VideoBackgroundView: UIViewRepresentable {
    let player: AVPlayer

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill  // 🔹 Llena el frame sin dejar negro
        playerLayer.frame = view.bounds
        playerLayer.needsDisplayOnBoundsChange = true
        
        view.layer.addSublayer(playerLayer)
        player.play()
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}

#Preview {
    TiersView()
}
