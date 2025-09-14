//
//  TiersLegendView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 12/9/25.
//

import SwiftUI

struct TiersLegendView: View {
    @Environment(\.dismiss) var dismiss
    @StateObject var viewModel: TiersLegendViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: Spacing.xl) {
                VStack(spacing: Spacing.sm) {
                    Text("HONEST\nPEOPLE.")
                        .font(.hgLegendTitle)
                    Text("YOU HAVE \(viewModel.points) GREEN STAMPS · VALID UNTIL \(viewModel.expireDate)")
                        .font(.hgTierLegendSubtitle)
                        .foregroundStyle(.secondary)
                }
                ForEach(BenefitsTier.allCases, id: \.self) { benefit in
                    TierCardView(
                        benefits: benefit,
                        tierTag: viewModel.matchTierWithBenefit(benefit: benefit),
                        actualBenefit: viewModel.tierBenefit
                    )
                }
                HomeSectionThree(expireDate: viewModel.expireDate)
            }
            .padding(.horizontal, Spacing.xl)
        }
        .padding(.vertical, Spacing.xl)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .safeAreaInset(edge: .top) {
            Header(
                title: "",
                backButton: false,
                closeButton: true,
                dismiss: dismiss
            )
        }
        .background(
            Color.background
        )
    }
}

#Preview {
    let viewModel = TiersLegendViewModel(tier: .bronze, expireDate: "01/01/2026", points: 120)
    TiersLegendView(viewModel: viewModel)
}
