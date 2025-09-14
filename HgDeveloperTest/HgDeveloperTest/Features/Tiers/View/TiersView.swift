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
    @StateObject var viewModel: TiersViewModel
    
    var body: some View {
        ZStack {
            VideoPlayer(player: viewModel.player)
                .onAppear {
                    viewModel.player.play()
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
                        tagStyle: viewModel.tier,
                        tierActive: false
                    )
                    Text(viewModel.tier.tierTitle)
                        .font(.hgTierTitle)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    HStack {
                        ForEach(1..<5) { item in
                            if (item <= viewModel.tier.numberOfStars) {
                                Image(systemName: "sparkle")
                                    .foregroundStyle(.white)
                            } else {
                                Image(systemName: "lock.fill")
                                    .foregroundStyle(.terracota)
                            }
                        }
                    }
                    Text(viewModel.tier.tierSubtitle)
                        .font(.hgRewardTitle)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    HgTierButton(
                        action: { viewModel.setShowingSheet(true)
                        }
                    )
                }
            }
            .padding(Spacing.xl)
        }
        .sheet(isPresented: $viewModel.showingSheet) {
            let tiersLegendViewModel = TiersLegendViewModel(tier: viewModel.tier, expierDate: "01/01/2025")
            TiersLegendView(viewModel: tiersLegendViewModel)
        }
    }
}

#Preview {
    var viewModel = TiersViewModel(tier: .bronze)
    TiersView(viewModel: viewModel)
}
