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
    private let pointsFrontier: Float = 125
    private let secondPhaseUpLimit: Int = 200
    
    var body: some View {
        VStack (spacing: Spacing.md) {
            VStack(alignment: .leading,spacing: Spacing.sm) {
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
                
                HStack (spacing: Spacing.xs) {
                    Text(viewModel.points <= pointsFrontier ? "You have" : "Get")
                        .font(.hgBody)
                        .foregroundStyle(.secondary)
                    Text(viewModel.points <= pointsFrontier ? "\(Int(viewModel.points))" : "\(secondPhaseUpLimit - Int(viewModel.points))")
                        .font(.hgBody)
                        .foregroundStyle(.baseGray)
                    Text(viewModel.points <= pointsFrontier ? "green stamps." : "green stamps more before")
                        .font(.hgBody)
                        .foregroundStyle(.secondary)
                }
                Text(viewModel.points <= pointsFrontier ? "You’re real honest people!" : "01/01/2026 to keep your level, Legend.")
                    .font(.hgBody)
                    .foregroundStyle(.secondary)
                if (viewModel.points >= pointsFrontier) {
                    HStack {
                        Text("\(Int(viewModel.points) - 100) of 100 Green stamps")
                            .font(.hgBody)
                            .foregroundStyle(.honestVisibility)
                            .padding(.horizontal, Spacing.md)
                            .padding(.vertical, Spacing.sm)
                            .background(
                                Rectangle()
                                    .fill(.honestVisibility.opacity(0.1))
                                    .cornerRadius(CornerRadius.xs)
                            )
                    }
                }
            }
            .padding(.horizontal, Spacing.sm)
            HgProgressView()
                .environmentObject(viewModel)
        }
        .padding(.horizontal, Spacing.xl)
        .sheetOrFullScreen(isPresented: $showingSheet) {
            let tiersVM = TiersViewModel(
                tier: viewModel.tier,
                expireDate: viewModel.dateFormatter.string(from: viewModel.expireDate),
                points: Int(viewModel.points)
            )
            TiersView(viewModel: tiersVM)
        }
    }
}

#Preview {
    TierComponent()
        .environmentObject(HomeViewModel())
}
