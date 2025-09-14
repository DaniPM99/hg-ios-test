//
//  TierCardView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 12/9/25.
//

import SwiftUI

struct TierCardView: View {
    let benefits: BenefitsTier
    let tierTag: TagType
    let actualBenefit: BenefitsTier
    private let checkMarkWidth: CGFloat = 17
    private let checkMarkHeight: CGFloat = 13
    private let tierTagOffset: CGFloat = -16
    
    var body: some View {
        VStack(alignment: .leading, spacing: Spacing.md) {
            HStack {
                Image(actualBenefit.rawValue >= benefits.rawValue ? "unlock" : "lock")
                VStack(alignment: .leading, spacing: Spacing.xs) {
                    Text(benefits.title)
                        .font(.hgTitle)
                        .foregroundColor(.black)
                    Text(benefits.body(
                        isActive: actualBenefit.rawValue == benefits.rawValue,
                        isPreviousFromActive: actualBenefit.rawValue >= benefits.rawValue
                    ))
                    .font(.hgTierLegendSubtitle)
                    .foregroundColor(.secondary)
                }
            }
            
            
            VStack(alignment: .leading, spacing: Spacing.md) {
                ForEach(benefits.benefits, id: \.self) { item in
                    HStack(spacing: Spacing.sm) {
                        Image(systemName: "checkmark")
                            .foregroundColor(actualBenefit.rawValue >= benefits.rawValue ? .green : .disabled)
                            .frame(width: checkMarkWidth, height: checkMarkHeight)
                        Text(item)
                            .font(.hgTierLegendBody)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, Spacing.md)
        .background(
            RoundedRectangle(cornerRadius: CornerRadius.lg)
                .fill(Color.white)
                .overlay(
                    RoundedRectangle(cornerRadius: CornerRadius.lg)
                        .stroke(
                            actualBenefit.rawValue == benefits.rawValue ? benefits.color : .clear,
                            lineWidth: 2.5
                        )
                )
        )
        .overlay(alignment: .topTrailing) {
            TierTag(
                tagStyle: tierTag,
                tierActive: actualBenefit.rawValue == benefits.rawValue,
                isAnimated: false
            )
            .offset(x: tierTagOffset, y: tierTagOffset)
        }
    }
}

#Preview {
    TierCardView(
        benefits: .gold,
        tierTag: .gold,
        actualBenefit: .gold
    )
}
