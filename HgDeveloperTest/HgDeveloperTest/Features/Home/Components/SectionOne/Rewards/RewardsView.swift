//
//  RewardsView.swift
//  HgDeveloperTest
//
//  Created by Daniel Parra Martin on 11/9/25.
//

import SwiftUI

struct RewardsView: View {
    var body: some View {
        VStack (spacing: 16) {
            VStack(alignment: .leading,spacing: 8) {
                Text("Rewards.")
                    .font(.hgTitle)
                Text("These are your rewards this month.")
                    .font(.hgBody)
                    .foregroundStyle(.secondary)
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(RewardType.allCases, id: \.self) { style in
                            RewardCard(rewardType: style)
                        }
                    }
                }
            }
            .padding(.leading, Spacing.md)
        }
    }
}

#Preview {
    RewardsView()
}
