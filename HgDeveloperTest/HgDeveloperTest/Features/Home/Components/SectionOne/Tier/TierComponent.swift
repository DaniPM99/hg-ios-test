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
                if (viewModel.points <= pointsFrontier) {
                    HStack (spacing: Spacing.xs) {
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
                } else {
                    HStack (spacing: Spacing.xs) {
                        Text("Get")
                            .font(.hgBody)
                            .foregroundStyle(.secondary)
                        Text("\(secondPhaseUpLimit - Int(viewModel.points))")
                            .font(.hgBody)
                            .foregroundStyle(.baseGray)
                        Text("green stamps more before")
                            .font(.hgBody)
                            .foregroundStyle(.secondary)
                    }
                    Text("01/01/2026 to keep your level, Legend.")
                        .font(.hgBody)
                        .foregroundStyle(.secondary)
                    HStack {
                        Text("\(secondPhaseUpLimit - Int(viewModel.points)) of 100 Green stamps")
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
                expireDate: viewModel.dateFormatter.string(from: viewModel.expireDate)
            )
            TiersView(viewModel: tiersVM)
        }
    }
}

#Preview {
    TierComponent()
        .environmentObject(HomeViewModel())
}
