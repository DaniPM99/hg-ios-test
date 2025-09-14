//
//  TierCardView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 12/9/25.
//

import SwiftUI

struct TierCardView: View {
    let benefits: BenefitsTier
    let isActive: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Image(isActive ? "unlock" : "lock")
                VStack(alignment: .leading, spacing: 4) {
                    Text(benefits.title)
                        .font(.hgTitle)
                        .foregroundColor(.black)
                    Text(benefits.body)
                        .font(.hgTierLegendSubtitle)
                        .foregroundColor(.secondary)
                }
            }

            
            // Lista de beneficios
            VStack(alignment: .leading, spacing: 12) {
                ForEach(benefits.benefits, id: \.self) { item in
                    HStack(spacing: 8) {
                        Image(systemName: "checkmark")
                                .foregroundColor(isActive ? .green : .disabled)
                                .frame(width: 17, height: 13)
                        Text(item)
                            .font(.hgTierLegendBody)
                            .foregroundColor(.black)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 16)
        .background(
            RoundedRectangle(cornerRadius: 16)
                .fill(Color.white)
                .border(isActive ? benefits.color : .disabled, width: 1)
                .cornerRadius(14)
                .shadow(color: isActive ? benefits.color : .disabled, radius: 40, x: 0, y: 2)
        )
    }
}

#Preview {
    TierCardView(benefits: .gold, isActive: false)
}
