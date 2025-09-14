//
//  TierComponent.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct TierComponent: View {
    @EnvironmentObject var viewModel: HomeViewModel
    @State private var showingSheet = false
    
    var body: some View {
        VStack (spacing: 16) {
            VStack(alignment: .leading,spacing: 8) {
                HStack {
                    Text("YOU'RE A \(viewModel.tier.title(tierActive: false).uppercased()).")
                        .font(.hgTitle)
                    Spacer()
                    HgButton(
                        hgType: .knowMore,
                        action: {
                            showingSheet.toggle()
                        }
                    )
                }
                HStack (spacing: 3) {
                    Text("You have")
                        .font(.hgBody)
                        .foregroundStyle(.secondary)
                    Text("\(Int(viewModel.points))")
                    .font(.hgBody)
                    .foregroundStyle(.baseGray)
                    Text("green stamps.")
                    .font(.hgBody)
                    .foregroundStyle(.secondary)
                }
                Text("You’re real honest people!")
                    .font(.hgBody)
                    .foregroundStyle(.secondary)
            }
            .padding(.horizontal, Spacing.sm)
            HgProgressView(points: viewModel.points)
        }
        .padding(.horizontal, Spacing.xl)
        .sheet(isPresented: $showingSheet) {
            let tiersViewModel = TiersViewModel(tier: viewModel.tier)
            TiersView(viewModel: tiersViewModel)
        }
    }
}

#Preview {
    TierComponent()
        .environmentObject(HomeViewModel())
}
