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
                if (viewModel.points <= 125) {
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
                } else {
                    HStack (spacing: 3) {
                        Text("Get")
                            .font(.hgBody)
                            .foregroundStyle(.secondary)
                        Text("\(200 - Int(viewModel.points))")
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
                        Text("\(200 - Int(viewModel.points)) of 100 Green stamps")
                            .font(.hgBody)
                            .foregroundStyle(.honestVisibility)
                            .padding(.horizontal, 12)
                            .padding(.vertical, 6)
                            .background(
                                Rectangle()
                                    .fill(.honestVisibility.opacity(0.1))
                                    .cornerRadius(8)
                            )
                    }
                }
            }
            .padding(.horizontal, Spacing.sm)
            HgProgressView()
                .environmentObject(viewModel)
        }
        .padding(.horizontal, Spacing.xl)
        .sheet(isPresented: $showingSheet) {
            let tiersViewModel = TiersViewModel(
                tier: viewModel.tier,
                                                expireDate: viewModel.dateFormatter.string(from: viewModel.expireDate))
            TiersView(viewModel: tiersViewModel)
        }
    }
}

#Preview {
    TierComponent()
        .environmentObject(HomeViewModel())
}
