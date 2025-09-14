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
            VStack(spacing: 32) {
                VStack(spacing: 8) {
                    Text("HONEST\nPEOPLE.")
                        .font(.hgLegendTitle)
                    Text("YOU HAVE XX GREEN STAMPS · VALID UNTIL 17/09/2023")
                        .font(.hgTierLegendSubtitle)
                        .foregroundStyle(.secondary)
                }
                ForEach(BenefitsTier.allCases, id: \.self) { benefit in
                    TierCardView(benefits: benefit, isActive: viewModel.tierBenefit.rawValue >= benefit.rawValue)
                }
                HomeSectionThree(expireDate: viewModel.expierDate)
            }
            .padding(.horizontal, 36)
        }
        .padding(.top, Spacing.xl)
        .background(
            Color.background
        )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    let viewModel = TiersLegendViewModel(tier: .bronze, expierDate: "01/01/2026")
    TiersLegendView(viewModel: viewModel)
}
