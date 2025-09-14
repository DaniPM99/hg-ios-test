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
            Header(
                title: "",
                backButton: false,
                closeButton: true,
                dismiss: dismiss
            )
            .padding(.horizontal, 36)
            VStack(spacing: 32) {
                VStack(spacing: 8) {
                    Text("HONEST\nPEOPLE.")
                        .font(.hgLegendTitle)
                    Text("YOU HAVE XX GREEN STAMPS · VALID UNTIL 17/09/2023")
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
            .padding(.horizontal, 36)
        }
        .padding(.vertical, Spacing.xl)
        .background(
            Color.background
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
    }
}

#Preview {
    let viewModel = TiersLegendViewModel(tier: .gold, expireDate: "01/01/2026")
    TiersLegendView(viewModel: viewModel)
}
