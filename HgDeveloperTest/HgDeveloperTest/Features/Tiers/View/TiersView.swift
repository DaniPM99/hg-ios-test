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
                        tierActive: false,
                        isAnimated: false)
                    Text(viewModel.tier.tierTitle)
                        .font(.hgTierTitle)
                        .foregroundStyle(.white)
                        .multilineTextAlignment(.center)
                    StarsRow(numberOfStars: viewModel.tier.numberOfStars)
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
            let tiersLegendViewModel = TiersLegendViewModel(tier: viewModel.tier, expireDate: viewModel.expireDate)
            TiersLegendView(viewModel: tiersLegendViewModel)
        }
    }
}

#Preview {
    var viewModel = TiersViewModel(tier: .silver, expireDate: "01/01/2026")
    TiersView(viewModel: viewModel)
}
