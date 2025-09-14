//
//  RewardsView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct RewardsView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: Spacing.lg) {
                VStack (alignment: .leading,spacing: Spacing.xs) {
                    Text("REWARDS.")
                        .font(.hgTitle)
                    Text("These are your rewards this month.")
                        .font(.hgBody)
                        .foregroundStyle(.secondary)
                }
                .padding(.horizontal, Spacing.xl)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: Spacing.lg) {
                        ForEach(RewardType.allCases, id: \.self) { style in
                            RewardCard(rewardType: style)
                        }
                    }
                    .padding(.leading, Spacing.xl)
                }
        }
    }
}

#Preview {
    RewardsView()
}
